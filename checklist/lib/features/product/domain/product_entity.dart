abstract class ProductEntity {
  final String id;
  final String userId;
  final String product;
  final String quantity;
  bool isConcealed;
  final String created;
  ProductEntity({
    required this.id,
    required this.userId,
    required this.product,
    required this.quantity,
    this.isConcealed = false,
    required this.created,
  });
}
