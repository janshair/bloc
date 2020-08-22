import 'dart:convert';

import '../events/user_event.dart';
import '../model/users.dart';
import '../states/users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as backend;

class UsersBloc extends Bloc<UserEvent, UserState> {

  @override
  UserState get initialState => UsersInitial();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    final currentState = state;
    if (event is UsersFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is UsersInitial) {
          final users = await _fetchUsers(0);
          yield UsersSuccess(users: users, hasReachedMax: false);
          return;
        }

        if (currentState is UsersSuccess) {
          final users = await _fetchUsers(currentState.users.length);
          yield users.isEmpty ? currentState.copyWith(hasReachedMax: true) :
          UsersSuccess(users: currentState.users + users, hasReachedMax: false);
        }
      } catch (error) {
        yield UsersFailure();
      }
    }
  }


  bool _hasReachedMax(UserState state) =>
      state is UsersSuccess && state.hasReachedMax;

  Future<List<User>> _fetchUsers(int since) async {
    print('since = $since');
    final response = await backend.get(
        'https://api.github.com/users?since=$since');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawUser) {
        return User(
          id: rawUser['id'] as int,
          login: rawUser['login'] as String,
          node_id: rawUser['node_id'] as String,
          avatar_url: rawUser['avatar_url'] as String,
        );
      }).toList();
    } else {
      print('error fetching posts');
      throw Exception('error fetching posts');
    }
  }
}