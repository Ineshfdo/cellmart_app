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

  factory Product.fromJson(Map<String, dynamic> json) {
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

  // Helper to get full image URL or asset path
  // Since user mentioned "load the image form the Images folder", we might need to handle this.
  // We'll assume if it's not a full URL, it's relative to server.
  // HOWEVER, for now, we will just return the image string and handle logic in UI or Service.
  // Actually, let's look at the user request again. "do the products image get the url and load the image form the Images folder"
  // It likely means: http://10.0.2.2:8000/Images/<filename>.
}
