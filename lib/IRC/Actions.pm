#!/usr/bin/perl

use strict;
use warnings;

package IRC::Actions;

sub NICK {
    my $handle = shift;
    my $nick   = shift;
    print $handle "NICK $nick\r\n";
}

sub USER {
    my $handle = shift;
    my $nick   = shift;
    my $user   = shift;
    print $handle "USER $nick 0 * :$user\r\n";
}

sub PONG {
    my $handle = shift;
    my $ping   = shift;
    $ping =~ s/PING //;
    print $handle "PONG $ping\r\n";
}

sub JOIN {
    my $handle = shift;
    my $join   = shift;
    print $handle "JOIN $join\r\n";
}

sub PRIVMSG {

}

1;

