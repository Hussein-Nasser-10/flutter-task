class Product {
  late int id;
  late String title;
  late double price;
  late String description;
  late String category;
  late String image;
  late double rate;
  late int count;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rate,
      required this.count});
  Product.tojson(Map<String, dynamic> json) {
    id = json['id'] ?? 1;
    title = json['title'] ?? '';
    price = (json['price'] ?? 1).toDouble();
    description = json['description'] ?? '';
    category = json['category'] ?? '';
    image = json['image'] ?? '';
    rate = (json['rating']['rate'] ?? 1).toDouble();
    count = json['rating']['count'] ?? 0;
  }
}
