import 'package:checklist/feautres/orders/data/order_repositry.dart';
import 'package:flutter/material.dart';
import "package:flutter_localizations/flutter_localizations.dart";

class Odersview extends StatelessWidget {
  final OrderRepositry orderRepositry = OrderRepositry();
  Widget build(BuildContext c) {
    return MaterialApp(
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(
        body: FutureBuilder(
          future: orderRepositry.getOrders(),
          builder: (context, asyncSnapshot) {
            final orders = asyncSnapshot.data ?? [];
            if (asyncSnapshot.hasError) {
              return Center(child: Text("حدث خطأ: ${asyncSnapshot.error}"));
            }
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text("الطلبيات"),
                  Text(orderRepositry.orders.length.toString()),
                  Center(
                    child: SizedBox(
                      width: 400,
                      height: 400,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text("الرقم")),
                            DataColumn(label: Text("معرف المستخدم")),
                            DataColumn(label: Text("المنتج")),
                            DataColumn(label: Text("تاريخ الطلبية")),
                          ],
                          rows: orders.map((p) {
                            return DataRow(
                              cells: [
                                DataCell(Text(p.id)),
                                DataCell(Text(p.userId)),
                                DataCell(Text(p.product)),
                                DataCell(Text(p.created)),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
