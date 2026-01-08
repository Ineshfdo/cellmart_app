import 'package:animate_do/animate_do.dart';
import 'package:cellmart_app/components/InfoSection.dart';
import 'package:cellmart_app/components/footer.dart';
import 'package:cellmart_app/components/productCard.dart';
import 'package:flutter/material.dart';
import 'package:cellmart_app/components/PhotoAnimation.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> products = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final fetchedProducts = await ProductService.getProducts();
      if (mounted) {
        setState(() {
          if (fetchedProducts.length > 24) {
            products = fetchedProducts.take(24).toList();
          } else {
            products = fetchedProducts;
          }
          _filteredProducts = products;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _searchProducts(String query) {
    setState(() {
      _filteredProducts = query.isEmpty
          ? List.from(products)
          : products
                .where(
                  (product) =>
                      product.name.toLowerCase().contains(query.toLowerCase()),
                )
                .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 3;
    if (screenWidth >= 1200) {
      crossAxisCount = 8;
    } else if (screenWidth >= 800) {
      crossAxisCount = 5;
    }

    double childAspectRatio = (screenWidth / crossAxisCount) / 280;

    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    final inputFillColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[800]
        : Colors.grey[200];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "CellMart",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
              color: Color(0xFF0A4C8A),
              fontFamily: "Nano",
            ),
          ),
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 300, child: PhotoAnimation()),
            const Divider(),

            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: _searchController,
                onChanged: _searchProducts,
                decoration: InputDecoration(
                  hintText: "Search for a product...",
                  prefixIcon: Icon(Icons.search, color: textColor),
                  filled: true,
                  fillColor: inputFillColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            if (_isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (_errorMessage != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Error: $_errorMessage",
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              )
            else if (_filteredProducts.isEmpty)
              Center(
                child: Text(
                  "No products found",
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
              )
            else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(14),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 14,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: _filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = _filteredProducts[index];

                  return FadeInUp(
                    duration: const Duration(milliseconds: 400),
                    delay: Duration(milliseconds: index * 80),
                    // Remove GestureDetector here because productCard now handles it internally
                    child: productCard(product: product),
                  );
                },
              ),

            const Divider(),

            const InfoSection(
              title: "Why You Chose CellMart",
              imagePath:
                  "assets/images/allphones.webp", // This remains a static asset
              content1:
                  "At CellMart, our customers are at the heart of everything we do. We are committed to delivering quality products, reliable service, and a smooth shopping experience. Every decision we make is driven by customer satisfaction, trust, and long-term relationships built through care, value, and consistency.",
              content2:
                  "Feel free to reach out to us anytime via email, phone, or our social media channels for assistance, inquiries, or support. We’re always happy to help and ensure you have the best possible experience with CellMart.",
            ),

            const Divider(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
