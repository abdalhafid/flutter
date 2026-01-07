import 'package:checklist/features/product/domain/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.userId,
    required super.product,
    required super.quantity,
    required super.isConcealed,
    required super.created,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      userId: json['userId'],
      product: json['product'],
      quantity: json['quantity'],
      isConcealed: json['isConcealed'],
      created: json['created'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'product': product,
      'quantity': quantity,
      'isConcealed': isConcealed,
      'created': created,
    };
  }
}
