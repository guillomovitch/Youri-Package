# $Id$
package Youri::Package::Base;

=head1 NAME

Youri::Package::Base - Youri Base Package Class

=head1 DESCRIPTION

This module implement the Base class of the Package class

=cut


use Carp;
use strict;
use warnings;


=head2 new()

Instantiates a Base Package object.

=cut

sub new {
    my $class   = shift;
    my %options = (
                   @_
                  );
    my $self = bless {
                     }, $class;

    $self->_init(%options);

    return $self;
}

sub _init {
    # do nothing
}

1;
