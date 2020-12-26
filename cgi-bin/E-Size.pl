#!/usr/bin/perl

# Erosic Web Services
# Script: E-Size
# Version: 1.0
# Date: 17 Oct 2000
# Author: eric418 (4w1r8@i.am)
# WebSite: http://erosic.uhome.net
#
# Copyright (c) 2000 Erosic Web Services. All rights reserved.
# Permission given to use the script provided that this notice remains as is.
#
# To execute the script with the number of files:
# <!--#include virtual="path/to/E-Size.pl?file"-->
#
# To execute the script with the size of files in B:
# <!--#include virtual="path/to/E-Size.pl?sizeb"-->
#
# To execute the script with the size of files in KB:
# <!--#include virtual="path/to/E-Size.pl?sizekb"-->
#
# To execute the script with the size of files in MB:
# <!--#include virtual="path/to/E-Size.pl?sizemb"-->
#
# Required SSI
#
################################################################

# Change this to the "absolute path" of your server
################################################################
$IAM = `/usr/ucb/whoami` ;
chomp ($IAM);
#Our server runs CGIs as the user so I can do this :-)
$path = "/home/$IAM";

# No change for the following
################################################################

$String = "$ENV{QUERY_STRING}";

$file = 0;
use File::Find;
&find ( sub { $sizeb += -s }, "$path");
&find ( sub { $file += 1 }, "$path");
$sizekb = int ($sizeb / 1024);
$sizemb = int ($sizekb / 1024);

print "Content-Type: text/html\n\n";

if ($String eq file){
print "$file";
exit;
} elsif ($String eq sizeb){
print "$sizeb";
exit;
} elsif ($String eq sizekb){
print "$sizekb";
exit;
} elsif ($String eq sizemb){
print "$sizemb";
exit;
} else {
print "Wrong Query String!";
exit;
}
