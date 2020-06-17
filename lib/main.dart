import 'dart:async';

import 'package:blocpractise/timer/ticker.dart';
import 'package:blocpractise/timer/timer_bloc.dart';
import 'package:blocpractise/timer/ui/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:blocpractise/increment/increment.dart';
import 'package:blocpractise/increment_decrement/increment_decrement_bloc.dart';
import 'package:blocpractise/increment_decrement/increment_decrement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child: Timer(),
      ),
    );
  }
}

//home: IncrementPage()

//home: BlocProvider<CounterBloc>(
//create: (context) => CounterBloc(),
//child: CounterPage()),

//BlocProvider(
//create: (context) => TimerBloc(ticker: Ticker()),
//child: Timer(),
//),
