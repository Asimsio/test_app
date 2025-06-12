class Product {
  final int id;
  final String name;
  final double price;
  final String category;
  final String image;
  final double rating;
  final String description;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
    required this.description,
    this.quantity = 0,
  });

  Product copyWith({
    int? id,
    String? name,
    double? price,
    String? category,
    String? image,
    double? rating,
    String? description,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
    );
  }
}