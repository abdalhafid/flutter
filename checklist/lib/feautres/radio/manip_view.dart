import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ManipView extends StatefulWidget {
  State createState() => ManipState();
}

class ManipState extends State {
  Widget build(BuildContext c) {
    bool insert() {
      return true;
    }

    return Scaffold(
      appBar: AppBar(title: Text("ministre de la sante")),
      body: Card(
        child: Column(
          spacing: 10,
          children: [
            Text("envoi un examen radio"),
            Checkbox(value: false, onChanged: (value) => insert()),
          ],
        ),
      ),
    );
  }
}
