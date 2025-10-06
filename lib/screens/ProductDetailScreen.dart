import 'package:cellmart_app/components/footer.dart';
import 'package:cellmart_app/screens/cartScreen.dart';
import 'package:cellmart_app/components/cart_storage.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final String imagepath;
  final String name;
  final String stats;
  final String price;
  final String description;

  const ProductDetailScreen({
    super.key,
    required this.imagepath,
    required this.name,
    required this.stats,
    required this.price,
    required this.description,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String color = "Black";
  String warranty = "1 year";

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_rounded, size: 20, color: textColor),
          onTap: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Nano",
                color: textColor,
              ),
            ),
            const SizedBox(width: 58),
          ],
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 7),
            Center(
              child: Image.asset(
                widget.imagepath,
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),

            const SizedBox(height: 2),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.stats,
                style: TextStyle(
                  fontSize: 16,
                  color: textColor?.withOpacity(0.6),
                ),
              ),
            ),

            const SizedBox(height: 2),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),

            const SizedBox(height: 10),
            const Divider(),

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
                '- ${widget.description}',
                style: TextStyle(
                  fontSize: 14,
                  color: textColor?.withOpacity(0.9),
                ),
              ),
            ),

            const Divider(),
            const SizedBox(height: 5),

            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
                color: isDark ? Colors.grey[850] : Colors.grey[200],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "Choose the color : ",
                      style: TextStyle(fontSize: 16, color: textColor),
                    ),
                  ),
                  DropdownButton<String>(
                    value: color,
                    dropdownColor: isDark ? Colors.grey[900] : Colors.white,
                    style: TextStyle(color: textColor),
                    items: ["Black", "White", "Blue", "Red"]
                        .map(
                          (item) =>
                              DropdownMenuItem(value: item, child: Text(item)),
                        )
                        .toList(),
                    onChanged: (value) => setState(() => color = value!),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(16, 30, 16, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
                color: isDark ? Colors.grey[850] : Colors.grey[200],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "Choose the warranty : ",
                      style: TextStyle(fontSize: 16, color: textColor),
                    ),
                  ),
                  DropdownButton<String>(
                    value: warranty,
                    dropdownColor: isDark ? Colors.grey[900] : Colors.white,
                    style: TextStyle(color: textColor),
                    items: ["1 year", "3 years", "5 years"]
                        .map(
                          (item) =>
                              DropdownMenuItem(value: item, child: Text(item)),
                        )
                        .toList(),
                    onChanged: (value) => setState(() => warranty = value!),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      final product = {
                        "productName": widget.name,
                        "productPrice": widget.price,
                        "productStats": widget.stats,
                        "productImage": widget.imagepath,
                        "productColor": color,
                        "productWarranty": warranty,
                      };

                      CartStorage.addItem(product);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A4C8A),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 55,
                        vertical: 20,
                      ),
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
              ],
            ),

            const SizedBox(height: 50),
            Divider(),
            const Footer(),
          ],
        ),
      ),
      backgroundColor: bgColor,
    );
  }
}
