use inc::Module::Install;

name           ('Clipboard');
author         ('Ryan King <rking@sharpsaw.org');
abstract       ('Cliboard - Copy and Paste with any OS');
license        ('perl');
version_from   ('lib/Clipboard.pm');
requires       ('Spiffy');
requires       ('Win32::Clipboard') if $^O =~ /mswin|cygwin/i;
install_script ("scripts/clip$_") for qw'join edit browse accumulate filter';
check_nmake();
WriteAll();
