import 'package:equatable/equatable.dart';

class User extends Equatable{
  int id;
  String login;
  String node_id;
  String avatar_url;

  User({
    this.id, this.login, this.node_id, this.avatar_url
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      login: json['login'] as String,
      node_id: json['node_id'] as String,
      avatar_url: json['avatar_url'] as String,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "id = ${this.id} login= ${this.login} node_id = ${this.node_id} avatar_url = ${this.avatar_url}";
  }

  @override
  // TODO: implement props
  List<Object> get props => [id,login];
}