import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/product.dart';

class ProductService {
  static Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse(ApiConfig.getAllProducts));

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        // The API returns { "products": [...] }
        if (decoded['products'] != null) {
          final List list = decoded['products'];
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

  // Helper to build image URL
  static String getImageUrl(String imagePath) {
    if (imagePath.startsWith('http')) {
      return imagePath;
    }

    // Normalize the path
    String cleanPath = imagePath.replaceAll('\\', '/');
    if (cleanPath.startsWith('/')) {
      cleanPath = cleanPath.substring(1);
    }

    // If the path from DB already includes "Images/", we append it to hostUrl
    // Otherwise we append it to assetsUrl (which includes /Images)
    if (cleanPath.toLowerCase().startsWith('images/')) {
      return "${ApiConfig.hostUrl}/$cleanPath";
    }

    return "${ApiConfig.assetsUrl}/$cleanPath";
  }
}
