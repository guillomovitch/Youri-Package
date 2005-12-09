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

use constant DEPENDENCY_NAME => 0;
use constant DEPENDENCY_RANGE => 1;

use constant FILE_NAME => 0;
use constant FILE_MODE => 1;
use constant FILE_MD5SUM => 2;

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

=head2 $package->age()

Returns the age of this package

=cut

sub age {
    croak "Not implemented method";
}

=head2 $package->source_package()

Returns the source package of this package

=cut

sub source_package {
    croak "Not implemented method";
}

=head2 $package->canonical_name()

Returns the canonical name of this package

=cut

sub canonical_name {
    croak "Not implemented method";
}

=head2 $package->buildtime()

Returns the time of last build, in number of second since epoch (like time())

=cut

sub buildtime {
    croak "Not implemented method";
}

1;
