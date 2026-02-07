class Product {
  final int id;
  final String name;
  final String? category;
  final String? subcategory;
  final double price;
  final String currency;
  final String? ram;
  final String? storage;
  final String image;
  final String description;
  final String? createdAt;
  final String? updatedAt;

  Product({
    required this.id,
    required this.name,
    this.category,
    this.subcategory,
    required this.price,
    required this.currency,
    this.ram,
    this.storage,
    required this.image,
    required this.description,
    this.createdAt,
    this.updatedAt,
  });

  //Transforms a JSON map into a structured Product object by mapping the data keys to the class properties.

  factory Product.fromJson(Map<String, dynamic> json) {
    //Get the image path from JSON and removes the leading slash.
    String rawImage = json['image']?.toString() ?? "";
    if (rawImage.startsWith('/')) {
      rawImage = rawImage.substring(1);
    }

    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? "Unknown Product",
      category: json['category'],
      subcategory: json['subcategory'],
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0.0,
      currency: json['currency'] ?? "LKR",
      ram: json['ram'],
      storage: json['storage'],
      image: rawImage.isNotEmpty ? rawImage : "",
      description: json['description'] ?? "",
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }
}
