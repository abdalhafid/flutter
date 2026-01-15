import 'package:flutter/material.dart';
import 'package:radio_dem/views/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radiology System',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginView(),
    );
  }
}
