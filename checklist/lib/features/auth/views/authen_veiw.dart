import 'package:flutter/material.dart'
class AuthVeiw extends StatefulWidget{
    final UsersRepository usersRepository;
    final TodosRepository todosRepository;
    const AuthView({super.key, required this.usersRepository, required this.todosRepository});

    State<AuthVeiw> createState()=>_AuthViewState()

}

class _AuthViewState extends State<AuthVeiw>{
    
}