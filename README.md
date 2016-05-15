# General Information

## State of the work

Currently the IRC client is only able to connect to one channel and is limited
to receiving messages. Entering commands and sending messages are not yet 
implemented. Colours are not supported.

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
perl client.pl -user "username" -name "real name" -server "your.host.com:6667" -channel "#channel"
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

# To-Do

 * Add option to send messages and enter commands
 * Add colour support

