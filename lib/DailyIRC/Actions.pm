#!/usr/bin/perl

use strict;
use warnings;

package DailyIRC::Actions;

#-------------------------------------------------------------------------------
# Definitions of all actions that require sending a command to the server.
#-------------------------------------------------------------------------------

sub NICK {
    my $handle = shift;
    my $nick   = shift;
    $handle->put("NICK $nick\r\n");
}

sub USER {
    my $handle = shift;
    my $nick   = shift;
    my $user   = shift;
    $handle->put("USER $nick 0 * :$user\r\n");
}

sub PONG {
    my $handle = shift;
    my $ping   = shift;
    $ping =~ s/PING //;
    $handle->put("PONG $ping\r\n");
}

sub JOIN {
    my $handle = shift;
    my $join   = shift;
    $handle->put("JOIN $join\r\n");
}

sub PRIVMSG {

}

1;

