
import 'package:blocpractise/utils/adaptive/screen_widgets.dart';
import 'package:flutter/widgets.dart';

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
          AdaptiveProgress(),
        Text(this.waitingMessage)
      ],
      ),
    );
  }
}