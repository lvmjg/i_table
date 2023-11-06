class PlaceOrderItem {
  final String id;
  final String category;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final bool status;
  late final double cost;

  PlaceOrderItem(
      {required this.id,
      required this.category,
      required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.status,
      this.cost = 0});

  String get summary => '$name x$quantity ($category)';
}
