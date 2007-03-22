#!/usr/bin/perl
# $Id$

use strict;
use warnings;
use Test::More;

eval "use Test::Prereq";
plan skip_all => "Test::Prereq required to test dependencies" if $@;
prereq_ok(undef, undef, [ qw/
    Test::Kwalitee
    Test::Perl::Critic
    Test::Pod
    Test::Pod::Coverage
 / ]);
