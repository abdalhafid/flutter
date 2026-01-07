import 'package:flutter/material.dart';

class DocLogin extends StatelessWidget {
  const DocLogin({super.key});

  Widget build(BuildContext bc) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          width: 500,
          child: Card(
            child: Column(
              spacing: 10,
              children: [
                Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                TextField(),
                TextField(),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: bc,
                      builder: (contex) {
                        return AlertDialog(
                          title: Text("تنبيه"),
                          content: Text("شكرا تم التسجيل"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(bc).pop();
                              },
                              child: Text("حسنا"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("تسجيل الدخول"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DocSubmit extends StatelessWidget {
  DocSubmit({super.key});
  final TextEditingController _controller = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('كتابة التشخيص')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text area
              TextField(
                controller: _controller,
                maxLines: 5, // multi-line text
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'اكتب التشخيص هنا',
                ),
              ),
              const SizedBox(height: 16),

              // Submit button
              ElevatedButton(
                onPressed: () {
                  final text = _controller.text.trim();
                  if (text.isEmpty) {
                    // show warning if empty
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('تنبيه'),
                        content: const Text('الرجاء ملئ محتوى التشخيص'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('اغلاق'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // show submitted text
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('تم حفظ التشخيص'),
                        content: Text('محتوى التشخيص:\n$text'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('اغلاق'),
                          ),
                        ],
                      ),
                    );
                    // Optionally clear the text field
                    _controller.clear();
                  }
                },
                child: const Text('حفظ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
