

import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String error;

  ErrorScreen(this.error);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error),
          Text(error)
        ],
      ),
    );
  }
}

