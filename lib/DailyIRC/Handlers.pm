#!/usr/bin/perl

use strict;
use warnings;

package DailyIRC::Handlers;

#-------------------------------------------------------------------------------
# Definition of all handlers for incoming information, that only needs to be
# printed to the screen in a formatted way.
#-------------------------------------------------------------------------------

sub JOIN {
    my $handle = shift;
    my $window = shift;
    my $join   = shift;
    $join =~ m/^:([^\s!%]*)(?:!|%)?\S*(?:@)\S* JOIN (.*)$/;
    $handle->print($window, "\0(statcolor)$1 has joined the channel $2\n");
}

sub PRIVMSG {
    my $handle = shift;
    my $window = shift;
    my $msg    = shift;
    $msg =~ m/^:([^\s!%]*)(?:!|%)?\S*(?:@)\S* PRIVMSG (\S*) :(.*)$/;
    $handle->print($window, "[$1 -> $2] $3\n");
}

sub QUIT {
    my $handle = shift;
    my $window = shift;
    my $quit   = shift;
    $quit =~ m/^:([^\s!%]*)(?:!|%)?\S*(?:@)\S* QUIT :(.*)$/;
    $handle->print($window, "\0(statcolor)$1 has quit: $2\n");
}

1;

