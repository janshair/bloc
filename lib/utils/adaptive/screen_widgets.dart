import 'package:universal_io/io.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_tile.dart';

class AdaptiveApp extends StatelessWidget {

  final String title;
  final Widget home;


  AdaptiveApp({this.title, this.home});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoApp (
      title: this.title,
      home: this.home,
    ) : MaterialApp(
      title: this.title,
      home: this.home,
    );
  }
}

class AdaptiveScaffold extends StatelessWidget {

  final String title;
  final Widget body;
  final AdaptiveFloatingActionButton floatingActionButton;

  AdaptiveScaffold({@required this.title,@required this.body, this.floatingActionButton });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoPageScaffold(navigationBar: adaptiveAppBar, child: body,) : Scaffold(appBar: adaptiveAppBar, body: this.body, floatingActionButton: floatingActionButton,);
  }

  PreferredSizeWidget get adaptiveAppBar => Platform.isIOS ? CupertinoNavigationBar(middle: Text(this.title), trailing: floatingActionButton != null ? floatingActionButton : SizedBox(),) : AppBar(title: Text(this.title),);

}

class AdaptiveFloatingActionButton extends StatelessWidget {

  final Widget child;
  final Function onTap;

  AdaptiveFloatingActionButton({this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? GestureDetector(child: child,
    onTap: onTap,) :FloatingActionButton(child: child, onPressed: onTap,);
  }
}


class AdaptiveGestureDetector extends StatelessWidget {
  final Function onTap;
  final Widget child;
  AdaptiveGestureDetector({this.onTap, this.child});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? GestureDetector(onTap: this.onTap, child: this.child,) : InkWell(onTap: this.onTap, child: this.child, borderRadius: BorderRadius.circular(15), splashColor: Theme.of(context).primaryColor,);
  }
}

class AdaptiveListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;


  AdaptiveListTile({this.leading, this.title, this.subtitle, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoListTile(leading: this.leading, title: this.title)
        : ListTile(leading: this.leading, title: this.title, subtitle: this.subtitle, trailing: this.trailing);
  }
}

class AdaptiveProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS? CupertinoActivityIndicator(): CircularProgressIndicator();
  }
}


class AdaptiveTabController extends StatelessWidget {
  final int length;
  final int initialIndex;
  final Widget child;


  AdaptiveTabController({this.length, this.initialIndex, this.child});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoTabScaffold(tabBuilder: (ctx, index) {
      return child;
    } ,) : DefaultTabController(initialIndex: initialIndex, length: length, child: child,);
  }
}