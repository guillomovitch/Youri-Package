# $Id$
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
use Carp;

sub get_pattern {
    my ($class, $name, $version, $release, $arch) = @_;

    return $class->get_unquoted_pattern(
        $name ? quotemeta($name) : undef,
        $version ? quotemeta($version) : undef,
        $release ? quotemeta($release) : undef,
        $arch ? quotemeta($arch) : undef
    );
}

sub get_unquoted_pattern {
    my ($class, $name, $version, $release, $arch) = @_;

    return 
        ($name ? $name : '[\w-]+' ).
        '-' .
        ($version ? $version : '[^-]+' ).
        '-' .
        ($release ? $release : '[^-]+' ). 
        '\.' .
        ($arch ? $arch : '\w+' ).
        '\.rpm';
}

sub as_file {
    my ($self) = @_;
    croak "Not a class method" unless ref $self;

    return $self->{_file};
}

sub is_debug {
    my ($self) = @_;
    croak "Not a class method" unless ref $self;

    return $self->get_name() =~ /-debug$/;
}

sub _parse_changelog_text {
    my ($self, $text) = @_;

    my @items = $text =~ /
        ^
        [-+ ] \s+ # list token
        (.*)      # real text
        $
        /xmg;

    return @items;
}

1;
