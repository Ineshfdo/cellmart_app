import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:cellmart_app/components/footer.dart';
import 'package:cellmart_app/screens/cartScreen.dart';
import 'package:cellmart_app/components/cart_storage.dart';
import 'package:flutter/material.dart';

// ✅ Favorites imports
import 'package:cellmart_app/db/favorites_db.dart';
import 'package:cellmart_app/models/favorite_product.dart';
import 'package:cellmart_app/screens/FavoritesScreen.dart';

import '../models/product.dart';
import '../services/auth_service.dart';

import 'loginScreen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String color = "Black";
  String warranty = "1 year";

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    final List<String> colorOptions = ["Black", "White", "Blue", "Red"];
    final List<String> warrantyOptions = ["1 year", "3 years", "5 years"];

    // Construct stats string if not present, or use what we have
    // The API product has 'ram', 'storage'. The old UI used 'stats' like "8GB - 256GB"
    String displayStats = "";
    if (widget.product.ram != null && widget.product.storage != null) {
      displayStats = "${widget.product.ram} - ${widget.product.storage}";
    }

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_rounded, size: 20, color: textColor),
        ),
        centerTitle: true,
        title: Text(
          widget.product.name,
          style: TextStyle(color: textColor),
          textAlign: TextAlign.center,
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            /// Product Image
            Center(
              child: Hero(
                tag: 'product_image_${widget.product.id}',
                child: Image.asset(
                  widget.product.image.startsWith('Images/')
                      ? widget.product.image
                      : 'Images/${widget.product.image}',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image, size: 100, color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// Product Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.product.name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),

            /// Product Stats
            if (displayStats.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  displayStats,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor?.withOpacity(0.6),
                  ),
                ),
              ),

            /// Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "${widget.product.currency} ${widget.product.price}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),

            const SizedBox(height: 10),
            const Divider(),

            /// DESCRIPTION
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 7, 3),
              child: Text(
                "Description",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 7, 5),
              child: Text(
                "- ${widget.product.description}",
                style: TextStyle(
                  fontSize: 14,
                  color: textColor?.withOpacity(0.9),
                ),
              ),
            ),

            const Divider(),
            const SizedBox(height: 10),

            /// 🎨 Color Dropdown (UNCHANGED)
            _dropdownSection(
              title: "Choose the color",
              value: color,
              items: colorOptions,
              isDark: isDark,
              onChanged: (val) {
                setState(() => color = val);
              },
            ),

            /// ⏳ Warranty Dropdown (UNCHANGED)
            _dropdownSection(
              title: "Choose the warranty",
              value: warranty,
              items: warrantyOptions,
              isDark: isDark,
              onChanged: (val) {
                setState(() => warranty = val);
              },
            ),

            const SizedBox(height: 30),

            /// BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// ADD TO CART
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!AuthService.isLoggedIn) {
                        // Prompt login
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please login to add items to cart"),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                        return;
                      }

                      final cartItem = {
                        "productName": widget.product.name,
                        "productPrice":
                            "${widget.product.currency} ${widget.product.price}",
                        "productStats": displayStats, // using computed stats
                        "productImage": widget.product.image,
                        "productColor": color,
                        "productWarranty": warranty,
                        "quantity": "1", // Add quantity with default value
                      };

                      CartStorage.addItem(cartItem);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A4C8A),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                /// 💚 ADD TO FAVORITES → GO TO FAVORITES SCREEN
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Login check for favorites too? User didn't specify, but safer.
                      // Leaving it open for now as user only said "before add products to the cart"

                      await FavoritesDB.addFavorite(
                        FavoriteProduct(
                          name: widget.product.name,
                          price:
                              "${widget.product.currency} ${widget.product.price}",
                          stats: displayStats,
                          image: widget.product.image,
                          color: color,
                          warranty: warranty,
                          description: widget.product.description,
                        ),
                      );

                      // ✅ Navigate to Favorites Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FavoritesScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Add to Favorites",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),
            const Divider(),
            const Footer(),
          ],
        ),
      ),
    );
  }

  /// 🔥 Dark-mode-safe animated dropdown (UNCHANGED)
  Widget _dropdownSection({
    required String title,
    required String value,
    required List<String> items,
    required bool isDark,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade400,
            width: 1.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
              ),
            ),
            const SizedBox(height: 10),
            CustomDropdown<String>(
              hintText: "Select",
              items: items,
              initialItem: value,
              onChanged: (val) => onChanged(val ?? value),
              decoration: CustomDropdownDecoration(
                closedFillColor: isDark
                    ? const Color(0xFF2A2A2A)
                    : Colors.white,
                expandedFillColor: isDark
                    ? const Color(0xFF2A2A2A)
                    : Colors.white,
                hintStyle: TextStyle(
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
                headerStyle: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
                listItemStyle: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
                closedBorder: Border.all(
                  color: isDark ? Colors.grey.shade700 : Colors.grey.shade400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
