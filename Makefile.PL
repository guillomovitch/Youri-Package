# $Id: /mirror/youri/soft/core/trunk/Makefile.PL 1284 2006-11-06T19:46:28.041137Z guillomovitch  $
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'Youri::Package',
    VERSION_FROM => 'lib/Youri/Package.pm',
    AUTHOR       => 'Youri project <youri@zarb.org>',
    PREREQ_PM  => {
        'Test::Exception' => 0,
        'Expect'          => 0,
        'RPM4'            => 0,
        'URPM'            => 0
    }
);
