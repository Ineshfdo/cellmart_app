import 'package:cellmart_app/screens/CheckoutScreen.dart';
import 'package:flutter/material.dart';
import 'package:cellmart_app/components/cart_storage.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cartItems = CartStorage.cartItems;

    // Calculate total price
    double totalAmount = 0;
    for (var product in cartItems) {
      String priceString = product["productPrice"]!
          .replaceAll("Rs", "")
          .replaceAll(",", "")
          .trim();
      totalAmount += double.tryParse(priceString) ?? 0;
    }

    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: textColor,
                size: 20,
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(0, 0, 35, 0),
                  child: Text(
                    "The Cart",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF0A4C8A),
                      fontFamily: "Nano",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: bgColor,
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                "Your cart is empty",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final product = cartItems[index];
                        return Card(
                          elevation: 0,
                          margin: const EdgeInsets.only(bottom: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: isDark ? Colors.grey[850] : Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    product["productImage"]!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product["productName"]!,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        product["productStats"]!,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: textColor?.withOpacity(0.6),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        product["productPrice"]!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Color: ${product["productColor"]!}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                      Text(
                                        "Warranty: ${product["productWarranty"]!}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cartItems.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: Border(
                      top: BorderSide(
                        color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _addressController,
                        style: TextStyle(color: textColor),
                        decoration: InputDecoration(
                          labelText: "Delivery Address",
                          labelStyle: TextStyle(color: textColor),
                          filled: true,
                          fillColor: isDark
                              ? Colors.grey[850]
                              : Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          Text(
                            "Rs ${totalAmount.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0A4C8A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 30,
                          ),
                        ),
                        onPressed: () {
                          if (_addressController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please enter a delivery address",
                                ),
                              ),
                            );
                            return;
                          }

                          final itemsCopy = List<Map<String, String>>.from(
                            cartItems,
                          );

                          // Clear cart after copying
                          CartStorage.cartItems.clear();

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(
                                address: _addressController.text,
                                total: totalAmount,
                                items: itemsCopy,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Go to Checkout",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
