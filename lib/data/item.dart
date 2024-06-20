class Item {
  String name;
  String id;
  String? count;
  double price;
  String? imageUrl;

  Item({
    required this.name,
    required this.id,
    required this.price,
    this.count,
    this.imageUrl,
  });
}
