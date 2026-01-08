import 'package:checklist/feautres/orders/data/order_entity.dart';
import 'package:dio/dio.dart';

class OrderRepositry {
  final Dio dio = Dio();
  List<OrderEntity> orders = [];
  Future<List<OrderEntity>> getOrders() async {
    var response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    for (var post in response.data as List<dynamic>) {
      orders.add(OrderEntity.fromJson(post));
    }
    return orders;
  }
}
