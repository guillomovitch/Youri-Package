# $Id: /local/youri/soft/trunk/lib/Youri/Package/URPM.pm 2257 2006-07-05T09:22:47.088572Z guillaume  $
package Youri::Package::RPM;

=head1 NAME

Youri::Package::RPM - Base class for all RPM-based package implementation

=head1 DESCRIPTION

This bases class factorize code between various RPM-based package
implementation.

=cut

use strict;
use warnings;
use base 'Youri::Package';

sub get_pattern {
    my ($class, $name, $version, $release, $arch) = @_;

    return 
        ($name ? quotemeta($name) : '[\w-]+' ).
        '-' .
        ($version ? quotemeta($version) : '[^-]+' ).
        '-' .
        ($release ? quotemeta($release) : '[^-]+' ). 
        '\.' .
        ($arch ? quotemeta($arch) : '\w+' ).
        '\.rpm';
}

1;
