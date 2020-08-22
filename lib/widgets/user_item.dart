import '../model/users.dart';
import '../utils/adaptive/screen_widgets.dart';
import 'package:flutter/widgets.dart';

class UserItem extends StatelessWidget {
  final User user;

  UserItem(this.user);

  @override
  Widget build(BuildContext context) {
    return AdaptiveListTile(
      leading: Image.network(user.avatar_url, width: 50, height: 50,),
      title: Text(user.login),
    );
  }
}
