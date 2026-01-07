import 'package:checklist/features/auth/data/data_tools/user_json_tool.dart';

class UsersRepository {
  List<UserJsonTool> users = [];

  // current user
  UserJsonTool? currentUser;

  // sign up
  UserJsonTool signUp(UserJsonTool user) {
    users.add(user);
    currentUser = user;
    return user;
  }

  // sign in
  UserJsonTool signIn(String email, String password) {
    var user = users.firstWhere(
      (user) => user.email == email && user.password == password,
    );
    currentUser = user;
    return user;
  }
}
