import 'package:checklist/features/auth/data/data_tools/user_json_tool.dart';
import 'package:checklist/features/product/data/repositry/product_repo.dart';
import 'package:flutter/material.dart';

class AuthVeiw extends StatefulWidget {
  final UserJsonTool usersRepository;
  final ProductRepository orderRepo;
  const AuthVeiw({
    super.key,
    required this.usersRepository,
    required this.orderRepo,
  });

  @override
  State<AuthVeiw> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthVeiw> {
  bool isSignup = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Auth')),
      body: isSignup
          ? SignupForm(
              usersRepository: widget.usersRepository,
              todosRepository: widget.todosRepository,
            )
          : SigninForm(
              usersRepository: widget.usersRepository,
              todosRepository: widget.todosRepository,
            ),
    );
  }
}
