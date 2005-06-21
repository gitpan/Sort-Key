#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 5;
use Sort::Key qw(nkeysort rnkeysort nsort rnsort);

use sort 'stable';

my @data=map { rand(20)-10 } 1..10000;

use integer;
is_deeply([nkeysort {$_} @data], [sort { int($a) <=> int($b)} @data], 'i id');
is_deeply([nkeysort {$_*$_} @data], [sort { int($a*$a) <=> int($b*$b) } @data], 'i sqr');
is_deeply([rnkeysort {$_*$_} @data], [sort { int($b*$b) <=> int($a*$a) } @data], 'ri sqr');
is_deeply([rnsort @data], [sort { int($b) <=> int($a) } @data], 'i rnsort');
is_deeply([nsort @data], [sort { int($a) <=> int($b) } @data], 'i nsort');
