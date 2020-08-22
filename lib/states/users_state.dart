import '../model/users.dart';
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UserState {}

class UsersFailure extends UserState {}

class UsersSuccess extends UserState {
  final List<User> users;
  final bool hasReachedMax;

  const UsersSuccess({this.users, this.hasReachedMax});

  UsersSuccess copyWith({List<User> users, bool hasReachedMax}) {
    return UsersSuccess(
        users: users ?? this.users,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  List<Object> get props => [users, hasReachedMax];

  @override
  String toString() =>
      'PostSuccess { users: ${users.length}, hasReachedMax: $hasReachedMax }';
}
