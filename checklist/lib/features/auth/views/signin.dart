import 'package:flutter/material.dart';
import 'package:checklist/features/auth/data/repository/user_repo.dart';
import 'package:checklist/features/product/data/repositry/product_repo.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({
    super.key,
    required this.usersRepository,
    required this.productRepository,
  });
  final UsersRepository usersRepository;
  final ProductRepository productRepository;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(decoration: InputDecoration(labelText: 'Email')),
          TextFormField(decoration: InputDecoration(labelText: 'Password')),
        ],
      ),
    );
  }
}
