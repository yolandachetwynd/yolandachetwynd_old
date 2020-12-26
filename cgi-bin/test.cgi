#!/usr/local/bin/perl5
print ("Content-Type:text/html\n\n");

$date = `/bin/date`;
$dir = `pwd`;
chop($dir);
print <<EOM;
<HEAD>
<TITLE>CGI TEST</TITLE>
</HEAD>
<BODY BGCOLOR=#ffffff>
The Current Date is: $date<P>

This is a test of your private cgi-bin directory. This script is stored
under $dir/test.cgi . All files in this directory can be
accessed at http://www.yourname.com/cgi-bin/(filename). Feel free to
delete this file.<P>

This is your own private directory in which you can store CGI scripts and
bins. We run on SUNOS so you'll have to get binaries for SUNOS, but PERL
scripts should drop right in. <P>


If reading this, it worked!
</BODY>
EOM
