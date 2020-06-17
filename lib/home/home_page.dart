
import 'package:blocpractise/increment/increment.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: OutlineButton(
        color: Colors.blue,
        textColor: Colors.white,
        disabledTextColor: Colors.blueAccent,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        child: Text('Increment'),

//          onPressed: startIncrementScreen(context),
      ),

      ),
    );
  }
  startIncrementScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => IncrementPage(title: 'Increment',)));
  }
}

