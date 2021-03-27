import 'package:flutter/material.dart';
import 'package:test123/views/testBloc/counter_bloc.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterBloc _counterBloc = CounterBloc();
  String log = "Counter Page ====> ";

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("$log is build");
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Center(
                child: StreamBuilder(
                  initialData: 0,
                  stream: _counterBloc.countStream,
                  builder: (context, data) {
                    if (data.hasData) {
                      return Text("Number ${data.data}  ");
                    } else if (data.connectionState == ConnectionState.active) {
                      return Text("Activie");
                    }
                    return Text("Something went wrong");
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 50, bottom: 50),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        _counterBloc.eventSink.add(CounterAction.InCreasement);
                      },
                      child: Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        _counterBloc.eventSink.add(CounterAction.Reset);
                      },
                      child: Icon(Icons.restore),
                    ),
                    FloatingActionButton(
                        onPressed: () {
                          _counterBloc.eventSink.add(CounterAction.Decrement);
                        },
                        child: Icon(Icons.remove)),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
