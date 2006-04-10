# $Id$
package Youri::Package;

=head1 NAME

Youri::Package - Abstract package class

=head1 DESCRIPTION

This abstract class defines Youri::Package interface.

=cut

use Carp;
use strict;
use warnings;

use constant DEPENDENCY_NAME  => 0;
use constant DEPENDENCY_RANGE => 1;

use constant FILE_NAME   => 0;
use constant FILE_MODE   => 1;
use constant FILE_MD5SUM => 2;

use constant CHANGE_AUTHOR => 0;
use constant CHANGE_TIME   => 1;
use constant CHANGE_TEXT   => 2;

=head1 CLASS METHODS

=head2 new(%args)

Creates and returns a new Youri::Package object.

Warning: do not call directly, call subclass constructor instead.

=cut

sub new {
    my $class   = shift;
    my %options = (
        @_
    );

    croak "Abstract class" if $class eq __PACKAGE__;

    my $self = bless {
    }, $class;

    $self->_init(%options);

    return $self;
}

sub _init {
    # do nothing
}

=head2 get_pattern($name, $version, $release, $arch)

Returns a pattern matching a file for a package, using available informations.

=head2 compare_versions($version1, $version2)

Compares $version1 and $version2, and returns a numeric value:

=over

=item > 0 if $version1 > $version2

=item 0 if $version1 = $version2

=item < 0 if $version1 < $version2

=back

=head2 compare_ranges($range1, $range2)

Compares $range1 and $range2, and returns a true value if they are compatible.

=head1 INSTANCE METHODS

=head2 get_name()

Returns the name of this package.

=head2 get_version()

Returns the version of this package.

=head2 get_release()

Returns the release of this package.

=head2 get_arch()

Returns the architecture of this package.

=head2 get_revision_name()

Returns the revision name of this package (name-version-release).

=head2 get_full_name()

Returns the full name of this package (name-version-release.arch).

=head2 get_file_name()

Returns the file name of this package (name-version-release.arch.extension).

=head2 get_file()

Returns the file containing this package.

=head2 is_source()

Returns true if this package is a source package.

=head2 is_binary()

Returns true if this package is a binary package.

=head2 get_type()

Returns the type (binary/source) of this package.

=head2 get_age()

Returns the age of this package

=head2 get_url()

Returns the URL of this package

=head2 get_summary()

Returns the summary of this package

=head2 get_description()

Returns the description of this package

=head2 get_packager()

Returns the packager of this package.

=head2 get_source_package()

Returns the name of the source package of this package.

=head2 get_tag($tag)

Returns the value of tag $tag of this package.

=head2 get_canonical_name()

Returns the canonical name of this package, shared by its multiple components,
usually the one from the source package.

=head2 get_requires()

Returns the list of dependencies required by this package, each dependency
being represented as an array reference, with the following informations:

=over

=item B<name>

Name of the dependency (index DEPENDENCY_NAME)

=item B<range>

Range of the dependency (index DEPENDENCY_RANGE)

=back

For more conveniency, fields index are available as constant in this package.

=head2 get_provides()

Returns the list of dependencies provided by this package, each dependency
being represented as an array reference, using the same structure as previous method.

=head2 get_obsoletes()

Returns the list of other packages obsoleted by this one, each one
being represented as an array reference, using the same structure as previous method.

=head2 get_conflicts()

Returns the list of other packages conflicting with this one.

=head2 get_files()

Returns the list of files contained in this package, each file being
represented as an array reference, with the following informations:

=over

=item B<name>

Name of the file (index FILE_NAME).

=item B<mode>

Mode of the file (index FILE_MODE).

=item B<md5sum>

Md5sum of the file (index FILE_MD5SUM).

=back

For more conveniency, fields index are available as constant in this package.

=head2 get_gpg_key()

Returns the gpg key id of package signature.

=head2 get_information()

Returns formated informations about the package.

=head2 get_changes()

Returns the list of changes for this package, each change being
represented as an array reference, with the following informations:

=over

=item B<author>

Author of the change (index CHANGE_AUTHOR).

=item B<time>

Time of the change (index CHANGE_TIME).

=item B<text>

Textual description of the change, as as array reference of individual changes
(index CHANGE_TEXT).

=back

For more conveniency, fields index are available as constant in this package.

=head2 get_last_change()

Returns the last change for this package, as as structure described before.

=head2 compare($package)

Compares release ordering with other package.

=head2 sign($name, $path, $passphrase)

Signs the package with given name, keyring path and passphrase.

=head2 extract()

Extract package content in local directory.

=head1 SUBCLASSING

All instances methods have to be implemented.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2002-2006, YOURI project

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=cut

1;
