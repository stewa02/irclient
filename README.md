# General Information

## State of the work

Currently the IRC client is only able to connect to one channel and is limited
to receiving messages. The only commands currently implemented are `quit` and
`help`.

## Inspiration

This simple IRC client is a attempt to build a minimal prototype of a functioning
console IRC client. It is inspired by these challenges on 
[Reddit](http://www.reddit.com/r/dailyprogrammer):

 * Challenge #258 [Easy] IRC: Making a Connection
 * Challenge #258 [Intermediate] IRC: Responding to commands
 * Challenge #258 [Hard] IRC: Interactivity

# Usage

## General Usage

The client can be opened in the command line:

```
dailyirc -user "username" -name "real name" -server "your.host.com:6667" -channel "#channel"
```

Arguments should be surrounded by quotes.

## Arguments

 * **-user:** *Required*; defines the nickname that is usually displayed when
   chatting.
 * **-name:** *Required*; defines a real name, can be set to anything. This 
   option is often used to store a small message.
 * **-server:** *Required*; defines server address and port for the connection.
 * **-channel:** *Required*; sets the channel that will be joined after 
   successfully connecting to the server.
 * **-debugger:** Can be set to "yes" to enable the output of the raw data 
   received from the server.

## Commands

To call a command rather than writing a message type a slash `/` first. The 
commands are:

 * **quit:** Close the server connection and exit the client.
 * **help:** Prints a help message.

# TODO

 * Implement sending private and public messages
 * Implement commands according to [Reddit thread](https://www.reddit.com/r/dailyprogrammer/comments/4ayjla/challenge_258_hard_irc_interactivity/)
 * Add multiple channel support and channel switching
 * Add colour support

