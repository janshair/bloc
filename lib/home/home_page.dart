import 'package:blocpractise/increment_decrement/increment_decrement_bloc.dart';

import '../increment_decrement/increment_decrement.dart';

import '../increment/increment.dart';
import '../timer/ticker.dart';
import '../timer/timer_bloc.dart';
import '../timer/ui/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          RaisedButton(
            color: Colors.blue,
            elevation: 5,
            textColor: Colors.white,
            child: Text('Increment'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return IncrementPage(title: 'Increment',);
              }));
            },
          ),
            RaisedButton(
              color: Colors.blue,
              elevation: 5,
              textColor: Colors.white,
              child: Text('Increment Decrement'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BlocProvider(
                    create: (context) => IncrementDecrementBloc(),
                    child: CounterPage(),
                  );
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              elevation: 5,
              textColor: Colors.white,
              child: Text('Timer'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BlocProvider(
                    create: (context) => TimerBloc(ticker: Ticker()),
                    child: Timer(),
                  );
                }));
              },
            )

        ],),
      ),
    );
  }
}
