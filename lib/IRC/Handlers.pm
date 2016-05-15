#!/usr/bin/perl

use strict;
use warnings;
use Term::ANSIColor;

package IRC::Handlers;

sub JOIN {
    my $join   = shift;
    $join =~ m/^:([^\s!%]*)(?:!|%)?\S*(?:@)\S* JOIN (.*)$/;
    print "$1 has joined the channel $2\n";
}

sub PRIVMSG {
    my $msg    = shift;
    $msg =~ m/^:([^\s!%]*)(?:!|%)?\S*(?:@)\S* PRIVMSG (\S*) :(.*)$/;
    print "[$1 -> $2] $3\n";
}

sub QUIT {
    my $quit   = shift;
    $quit =~ m/^:([^\s!%]*)(?:!|%)?\S*(?:@)\S* QUIT :(.*)$/;
    print "$1 has quit: $2\n";
}

1;

