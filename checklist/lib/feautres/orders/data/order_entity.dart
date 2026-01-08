class OrderEntity {
  String id;
  String userId;
  String product;
  String created;

  OrderEntity({
    required this.id,
    required this.userId,
    required this.product,
    required this.created,
  });

  factory OrderEntity.fromJson(Map<String, dynamic> json) {
    return OrderEntity(
      id: json["id"].toString(),
      userId: json["userId"].toString(),
      product: json["title"],
      created: "date",
    );
  }
}
