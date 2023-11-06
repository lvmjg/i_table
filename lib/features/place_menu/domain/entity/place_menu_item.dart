class PlaceMenuItem {
  final String id;
  final String category;
  final String name;
  final String description;
  final double price;
  final String? url;
  late int quantity;

  PlaceMenuItem(
      {required this.id,
      required this.category,
      required this.name,
      required this.description,
      required this.price,
      required this.url,
      this.quantity = 0});
}
