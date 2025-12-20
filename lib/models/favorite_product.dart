class FavoriteProduct {
  final int? id;
  final String name;
  final String price;
  final String stats;
  final String image;
  final String color;
  final String warranty;
  final String description;

  FavoriteProduct({
    this.id,
    required this.name,
    required this.price,
    required this.stats,
    required this.image,
    required this.color,
    required this.warranty,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stats': stats,
      'image': image,
      'color': color,
      'warranty': warranty,
      'description': description,
    };
  }

  factory FavoriteProduct.fromMap(Map<String, dynamic> map) {
    return FavoriteProduct(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      stats: map['stats'],
      image: map['image'],
      color: map['color'],
      warranty: map['warranty'],
      description: map['description'],
    );
  }
}
