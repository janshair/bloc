import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

PageRoute adaptivePageRoute(Widget widgetBuilder) {
 return Platform.isIOS ? CupertinoPageRoute(builder: (_) {
   return widgetBuilder;
 }
 ) : MaterialPageRoute(builder: (_) {
   return widgetBuilder;
 }
 );
}