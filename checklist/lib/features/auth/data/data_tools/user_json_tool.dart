import 'package:checklist/features/auth/domain/user_entity.dart';

class UserJsonTool extends UserEntity {
  UserJsonTool({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
  });

  factory UserJsonTool.fromJson(Map<String, dynamic> json) {
    return UserJsonTool(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'password': password};
  }
}
