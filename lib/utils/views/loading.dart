import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingScreen extends StatelessWidget {
  final String waitingMessage;

  LoadingScreen({this.waitingMessage = 'Please Wait'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        CircularProgressIndicator(),
        Text(this.waitingMessage)
      ],
      ),
    );
  }
}