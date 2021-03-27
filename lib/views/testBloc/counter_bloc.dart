import 'dart:async';



enum CounterAction { InCreasement, Decrement, Reset }

class CounterBloc {
  int counter;
  final _streamControler = StreamController<int>.broadcast();
  StreamSink<int> get counterSink => _streamControler.sink;
  Stream<int> get countStream => _streamControler.stream;

  final _eventStreamControler = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStreamControler.sink;
  Stream<CounterAction> get eventStream => _eventStreamControler.stream;

  CounterBloc() {
    counter = 0;
    eventStream.listen((event) {
      if (event == CounterAction.InCreasement) {
        counter++;
      } else if (event == CounterAction.Decrement) {
        counter--;
      } else if (event == CounterAction.Reset) {
        counter = 0;
      }
      // add out input to state
      counterSink.add(counter);
    });

    countStream.listen((event) {
      print("event");
    });
  }
  void dispose() {
    _eventStreamControler.close();
    _streamControler.close();
  }
}
