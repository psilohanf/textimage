#!/usr/bin/perl -w

# textimage.pl. (c) by Christoph Krüger christoph@krueger.name
# This script will generate a gif-image containing a quote and it's author
# Dependency: you have to have imagemagick installed

my ($quote, $author, $theme, $num_args);

$num_args = $#ARGV + 1;
die "usage: textimage.pl \'quote\' \'author\'\n" unless $num_args == 2;

my @bg = ('ffffff','bf8f30','2a4480','bf5930','259238','70227e','94256d','b0bc2f','206876', '000000','ffd073','6c8cd5','ff9b73','65e17b','c262d3','e266b7','f1fd72','5fbdce');
my @f1 = ('000000','ffd073','6c8cd5','ff9b73','65e17b','c262d3','e266b7','f1fd72','5fbdce', 'ffffff','bf8f30','2a4480','bf5930','259238','70227e','94256d','b0bc2f','206876');
my @f2 = ('777777','ffbf40','4671d5','ff7640','38e156','bc38d3','e238a7','edfd3f','37b6ce', 'ffffff','bf8f30','2a4480','bf5930','259238','70227e','94256d','b0bc2f','206876');

$quote = $ARGV[0];
$author = $ARGV[1];
$theme = int(rand($#bg));

# sanitize the strings
$quote =~ s/\!/\\!/g; 
$author =~ s/\!/\\!/g; 

system("convert -size 420x360 -background '#$bg[$theme]' -fill '#$f1[$theme]' -bordercolor '#$bg[$theme]' -gravity SouthWest -font Times-Italic caption:'\"$quote\"' -border 30 -crop 420x390+30+0 -font Times-Roman -gravity SouthEast -size 420x30 -fill '#$f2[$theme]' caption:'($author)' -append -border 30 +repage quote.gif");
