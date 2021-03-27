import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test123/bloc/postBloc/post_bloc.dart';
import 'package:test123/bloc/postBloc/post_event.dart';
import 'package:test123/bloc/postBloc/post_state.dart';

import 'package:http/http.dart' as http;

class CounterNumber extends StatefulWidget {
  @override
  _CounterNumberState createState() => _CounterNumberState();
}

class _CounterNumberState extends State<CounterNumber> {
  final String log = "CounterScreen===============> ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (_) => PostBloc(
                httpClient: http.Client(),
              )..add(
                  PostFetched(),
                ),
          child: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      if (state is PostInitial) {
        return Text("init");
      }
      if (state is PostFailure) {
        return Center(
          child: Text("faild"),
        );
      }
      if (state is PostSuccess) {
        if (state.listPosts.isEmpty) {
          return Center(
            child: Text("empty"),
          );
        } else
          return Text("get all text");
      }
      return Text("data");
    });
  }
}
