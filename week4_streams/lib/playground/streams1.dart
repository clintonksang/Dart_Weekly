import 'dart:async';

import 'dart:math';

/*
                              STREAM 
                          ------------------------------------------------
StreamController   -----> emit/add(value) ->         ->        ->               listen(onData, onError, onDone) ->  close() ->   
                          ------------------------------------------------

*/

// 1 start with stream controller
void main() async {
// METHOD 1

  StreamController<double> streamController = StreamController<double>();

// 2 Add/ emit values to the stream

  // values
  double first = 0.1;
  double second = 0.2;
  double third = 0.3;

  streamController.add(first);
  streamController.add(second);
  streamController.add(third);

// 3 The controllers stream can be accessed through the stream property

  Stream stream = streamController.stream.asBroadcastStream();
  // ** .asBroadcastStream() is used to make the stream broadcastable, meaning that it can be listened to multiple times.

  stream.listen((value) {
    print('Value from controller: $value');
  });

// 4 Stream Subscription is used to ensure no memory leaks ; is cancelling the listening when you're no longer required to receive the data.
  // creating a subscription
  StreamSubscription streamSubscription = stream.listen((event) {
    print('Value from streamsubscription: $event');
  });

  // cancelling the subscription
  // await streamSubscription.cancel();


}
