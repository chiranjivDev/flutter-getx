class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.image});

  // create product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
    );
  }
}
