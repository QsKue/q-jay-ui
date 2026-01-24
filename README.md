# QJay Remote

This is the crossplatform UI for the QJay Remote app for mobile & desktop.

QJay uses protobuf protocol for communication.

Transport works accross FFI, BLE and HTTP.
Communication occurs via 1 endpoint through which all messages are passed.

* FFT:
    * Currenlty supports dart via SnedPorts / Isolate
    * Relies on initialization function and setting up event listener for communication
* BLE:
    * QJay initializes a GATT server for communication.
    * BLE exposes multiple charachteristics, one for sending messages and the remainder for receving notifications.
* HTTP:
    * QJay sets up a local server who's address is advertised on _qjay._tcp
    * Communication is established via /request POST endpoint which handles all the messages
    * Notifications are sent via /listener websocket
 
The three ways of communication are identical, therefore a single implementation of the message handling can be reused for the different transports as seen in the code
