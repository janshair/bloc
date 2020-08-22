import '../bloc/users_bloc.dart';
import '../events/user_event.dart';
import '../model/users.dart';
import '../states/users_state.dart';
import '../utils/adaptive/screen_widgets.dart';
import '../utils/views/bottom_loader.dart';
import '../utils/views/error.dart';
import '../utils/views/loading.dart';
import '../widgets/user_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {


  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  UsersBloc _usersBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _usersBloc = BlocProvider.of<UsersBloc>(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _usersBloc.add(UsersFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      title: 'Users',
      body: BlocBuilder<UsersBloc,UserState>(
        builder: (context, state) {
          if(state is UsersInitial) {
            return LoadingScreen();
          }

          if(state is UsersFailure) {
            return ErrorScreen('Failed to load users');
          }

          if(state is UsersSuccess) {
            if(state.users.isEmpty) {
              return ErrorScreen('No users now');
            }

            return ListView.builder(
              itemCount: state.hasReachedMax ? state.users.length : state.users.length + 1,
              controller: _scrollController,
                itemBuilder: (context, index) {
                  return index >= state.users.length ? BottomLoader() : UserItem(state.users[index]);
                },);
          }
          return Center();
        },
      )
    );
  }
}
