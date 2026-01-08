import "package:flutter/material.dart";

import "package:checklist/feautres/orders/views/OdersView.dart";

class AuthVeiw extends StatelessWidget {
  Widget build(BuildContext c) {
    return Scaffold(
      appBar: AppBar(title: Text("المؤسسة العمومية الاستشفائية اولف")),
      body: Center(
        child: SizedBox(
          width: 320,
          height: 320,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                spacing: 10,
                children: [
                  Text("تسجيل الدخول"),
                  TextField(
                    decoration: InputDecoration(labelText: "اسم المستخدم"),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "كلمة المرور"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        c,
                        MaterialPageRoute(builder: (c) => Odersview()),
                      );
                    },
                    child: Text("دخول"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
