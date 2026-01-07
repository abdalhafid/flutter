import 'package:checklist/features/product/data/model/product_model.dart';

class ProductRepository {
  List<ProductModel> orders = [];

  // current user
  ProductModel? currentOrder;

  // sign up
  ProductModel add(ProductModel order) {
    orders.add(order);
    currentOrder = order;
    return order;
  }

  ProductModel conceal(String id) {
    final product = orders.firstWhere(
      (p) => p.id == id,
      orElse: () => throw Exception('Product not found'),
    );

    product.isConcealed = true;

    return product;
  }

  // sign in
  ProductModel search(String id) {
    var prodcut = orders.firstWhere((p) => p.id == id);
    currentOrder = prodcut;
    return prodcut;
  }
}
