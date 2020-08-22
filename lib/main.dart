import 'events/user_event.dart';
import 'utils/adaptive/screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/users_bloc.dart';
import 'screens/users_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => UsersBloc()..add(UsersFetched()),
        child: UsersScreen(),
      ),
    );
  }
}
