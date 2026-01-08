import 'package:animate_do/animate_do.dart';
import 'package:cellmart_app/components/footer.dart';
import 'package:cellmart_app/components/productCard.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> products = [];
  List<Product> _filteredProducts = [];
  String _selectedSubCategory = "All";
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
          products = fetchedProducts;
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

  List<String> getSubCategories() {
    final subcategories = products
        .map((p) => p.subcategory)
        .where((c) => c != null && c.isNotEmpty)
        .map((c) => c!)
        .toSet()
        .toList();
    subcategories.sort();
    return ["All", ...subcategories];
  }

  void _filterProducts() {
    setState(() {
      _filteredProducts = products.where((product) {
        final matchesCategory =
            _selectedSubCategory == "All" ||
            product.subcategory == _selectedSubCategory;
        final matchesSearch = product.name.toLowerCase().contains(
          _searchController.text.toLowerCase(),
        );
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  void _searchProducts(String query) {
    _filterProducts();
  }

  void _selectSubCategory(String subcategory) {
    _selectedSubCategory = subcategory;
    _filterProducts();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;
    final bgColor = theme.scaffoldBackgroundColor;
    final isDark = theme.brightness == Brightness.dark;

    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 3;
    if (screenWidth >= 1200) {
      crossAxisCount = 8;
    } else if (screenWidth >= 800) {
      crossAxisCount = 5;
    }

    double childAspectRatio = (screenWidth / crossAxisCount) / 280;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 15, 0, 15),
            child: const Text(
              "Latest Products",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Color(0xFF0A4C8A),
                fontFamily: "Nano",
              ),
            ),
          ),
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: isDark ? Colors.grey[700] : Colors.grey[300]),

            // Category Filter
            if (!_isLoading && _errorMessage == null)
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: getSubCategories().map((subcategory) {
                    final isSelected = _selectedSubCategory == subcategory;
                    return GestureDetector(
                      onTap: () => _selectSubCategory(subcategory),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF0A4C8A)
                              : (isDark ? Colors.grey[800] : Colors.grey[200]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          subcategory,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : (isDark ? Colors.white : Colors.black),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

            // Search Field
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                onChanged: _searchProducts,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "Search for a product...",
                  hintStyle: TextStyle(
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                  filled: true,
                  fillColor: isDark ? Colors.grey[850] : Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Product Grid with Animation
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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              )
            else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
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
                    child: productCard(product: product),
                  );
                },
              ),

            const Divider(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
