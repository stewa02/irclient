#!/usr/bin/perl

use strict;
use warnings;
use 5.010;
use lib "./lib";
use Socket;
use Term::Visual;
use IRC::Handlers;
use IRC::Actions;
use IRC::Commands;

our $VERSION = 0.1;

=pod

=head1 USAGE

This simple IRC client has to be called from the command line using the
following arguments:

    client.pl -user <USERNAME> -name <REALNAME> -server <SERVER:PORT>

Detailed information in the chapter ARGUMENTS.

=head1 ARGUMENTS

=over 1

=item -user

I<Required>; Defines a nickname (name that usually shows up in chat).

=item -name

I<Required>; Defines your real name.

=item -server 

I<Required>; Defines the server you connect to. Use format: your.server.com:6667

=item -channel

I<Required>; Defines channel to join after the connection is established. String
must be quoted.

=item -debugger
If you want to see the raw messages from the server, this argument must be set 
to "yes". This feature is mostly used by the author for debugging purposes.

=back

=head1 LICENSE

Copyright 2016 Stephan Wagner <stewatwo@cpan.org>. This program is free software; 
you may redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

The author is github.com/stewa02. 

stewa02 <stewatwo@cpan.org>

=cut

my %args;

sub CheckArgs {
    my %raw_args;
    my @required_args = ("-user", "-server", "-name", "-channel");
    my @possible_args = (@required_args, "-debugger");

    # $\ gets printed after the last argument of the print function, for 
    # reference: http://perldoc.perl.org/perlvar.html
    local $\ = "\n";

    select(STDERR);

    # Check amount of arguments
    if ($#ARGV % 2) {
        %raw_args = @ARGV;
    }
    else {
        print "Invalid argument structure!";
        exit;
    }

    # Check argument validity
    foreach (keys(%raw_args)) {
        unless ($_ ~~ @possible_args) {
            print "Unknown argument '$_'!";
            exit;
        }
    }

    # Check if argument list is complete
    foreach (@required_args) {
        unless (exists($raw_args{$_})) {
            print "Argument $_ is missing!";
            exit;
        }
    }
    
    %args = %raw_args;
}

sub Intro {
    print "irclient 0.1\nserver: ".$args{"-server"}."\nchannel: "
        .$args{"-channel"}."\nnick: ".$args{"-user"}."\nreal name: "
        .$args{"-name"}."\n\n";
}

sub Get {
    IRC::Actions::NICK(*SOCKET, $args{"-user"});
    IRC::Actions::USER(*SOCKET, $args{"-user"}, $args{"-name"});

    while (<SOCKET>) {
        print if $args{"-debugger"};
        fork and next;

        given ($_) {
            when (/PING/) { IRC::Actions::PONG(*SOCKET, $_) }
            when (/:End of \/MOTD command\./) 
                { IRC::Actions::JOIN(*SOCKET, $args{"-channel"}) }
            when (/JOIN/) { IRC::Handlers::JOIN($_) }
            when (/PRIVMSG/) { IRC::Handlers::PRIVMSG($_) }
            when (/QUIT/) { IRC::Handlers::QUIT($_) }
            #default { print }
        }

        exit;
    }
}

sub Connect {
    my $server = (split(":", $args{"-server"}))[0];
    my $port   = (split(":", $args{"-server"}))[1];

    socket(SOCKET, PF_INET, SOCK_STREAM, getprotobyname("tcp"));
    my $inetaddress = inet_aton($server);
    my $peeraddress = sockaddr_in($port, $inetaddress);

    connect(SOCKET, $peeraddress);
    select((select(SOCKET), $| = 1)[0]);

    Intro();
    Get();

    close(SOCKET) or shutdown(SOCKET, 1) and warn "Connection shutdown!\n";
}

CheckArgs();
Connect();

