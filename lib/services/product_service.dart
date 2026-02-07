import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/product.dart';

class ProductService {
  // Fetches all products from the backend API.
  static Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse(ApiConfig.getAllProducts));

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        if (decoded['products'] != null) {
          // Get products from that Map.
          final List list = decoded['products'];

          // Loops through every item in that list and converts each one into a object
          return list.map((e) => Product.fromJson(e)).toList();
        }
        return [];
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: $e');
    }
  }

  static String getImageUrl(String imagePath) {
    if (imagePath.startsWith('http')) {
      return imagePath;
    }

    // Normalize the path
    String cleanPath = imagePath.replaceAll('\\', '/');
    if (cleanPath.startsWith('/')) {
      cleanPath = cleanPath.substring(1);
    }

    // Checks whether the image path already starts with "images/" and chooses the correct base URL (hostUrl or assetsUrl) to give valid full image URL.
    if (cleanPath.toLowerCase().startsWith('images/')) {
      return "${ApiConfig.hostUrl}/$cleanPath";
    }

    return "${ApiConfig.assetsUrl}/$cleanPath";
  }
}
