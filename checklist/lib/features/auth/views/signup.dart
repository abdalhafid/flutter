import 'package:flutter/material.dart';
import 'package:checklist/features/auth/data/data_tools/user_json_tool.dart';
import 'package:checklist/features/auth/data/repository/user_repo.dart';
import 'package:checklist/features/product/data/repositry/product_repo.dart';
import 'package:mn/home.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
    required this.usersRepository,
    required this.productRepository,
  });
  final UsersRepository usersRepository;
  final ProductRepository productRepository;
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      controller: name,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      controller: email,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      controller: password,
                    ),
                    TextButton(
                      onPressed: () {
                        widget.usersRepository.signUp(
                          UserJsonTool(
                            id: '',
                            name: name.text,
                            email: email.text,
                            password: password.text,
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              todosRepository: widget.todosRepository,
                              usersRepository: widget.usersRepository,
                            ),
                          ),
                        );
                      },
                      child: Text('Signup'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
