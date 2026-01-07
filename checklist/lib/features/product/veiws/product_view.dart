import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  @override
  State<ProductView> createState() => productSate();
}

class productSate extends State<ProductView> {
  Widget build(BuildContext c) {
    return Scaffold(
      body: DataTable(
        columns: [
          DataColumn(label: Text("ID")),
          DataColumn(label: Text("UserID")),
          DataColumn(label: Text("Product")),
          DataColumn(label: Text("Quanityt")),
          DataColumn(label: Text("IsConcealed")),
          DataColumn(label: Text("Create")),
          ]
        rows: rows,
      ),
    );
  }
}
