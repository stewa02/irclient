#!/usr/bin/perl

use strict;
use warnings;
use Term::ANSIColor;

package DailyIRC::Commands;

#-------------------------------------------------------------------------------
# Definition of all the commands that can be used in the program.
#-------------------------------------------------------------------------------
my $helptext = <<HELP;

Start a command with the "/" character to indicate the client that you want to
call a command instead of sending a message.

List of commands:

    /quit        Quit the program and close the server connection.
    /help        Display this help message

HELP

sub QUIT {
    my $kernel = shift;
    my $handle = shift;
    $kernel->yield('_stop'); 
}

sub HELP {
    my $handle = shift;
    my $window = shift;
    $handle->print($window, $helptext);
}

1;

