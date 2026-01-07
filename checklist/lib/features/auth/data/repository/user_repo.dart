import 'package:checklist/features/auth/data/models/user_json_tool.dart';

class UsersRepository {
  List<userJsonTool> users = [];

  // current user
  userJsonTool? currentUser;

  // sign up
  userJsonTool signUp(userJsonTool user) {
    users.add(user);
    currentUser = user;
    return user;
  }

  // sign in
  userJsonTool signIn(String email, String password) {
    var user = users.firstWhere((user) => user.email == email && user.password == password);
    currentUser = user;
    return user;
  }
}