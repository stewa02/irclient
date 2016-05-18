#!/usr/bin/perl

use strict;
use warnings;

package DailyIRC::Commands;

#-------------------------------------------------------------------------------
# Definition of all the commands that can be used in the program.
#-------------------------------------------------------------------------------
my $helptext = <<HELP;
\0(metacolour)Start a command with the "/" character to indicate the client that you want to 
\0(metacolour)call a command instead of sending a message.

\0(metacolour)List of commands:

\0(metacolour)    /quit        Quit the program and close the server connection.
\0(metacolour)    /help        Display this help message
    
\0(metacolour)Not yet implemented:

\0(metacolour)    /join
\0(metacolour)    /msg
\0(metacolour)    /channel
\0(metacolour)    /nicks
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

