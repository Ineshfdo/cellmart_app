import 'package:cellmart_app/components/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cellmart_app/config/api_config.dart';
import 'package:cellmart_app/services/auth_service.dart';

class CheckoutScreen extends StatefulWidget {
  final String customerPhone;
  final String address;
  final double total;
  final List<Map<String, String>> items;

  const CheckoutScreen({
    super.key,
    required this.customerPhone,
    required this.address,
    required this.total,
    required this.items,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final Battery _battery = Battery();

  Future<void> _placeOrder(BuildContext context) async {
    final int batteryLevel = await _battery.batteryLevel;

    if (batteryLevel <= 20) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Low Battery',
        text:
            'Your battery level is too low ($batteryLevel%).\nPlease charge your device before placing the order.',
        confirmBtnText: 'OK',
      );
      return;
    }

    // Show loading indicator
    QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Processing',
      text: 'Placing your order...',
    );

    try {
      // Prepare products data
      List<Map<String, dynamic>> productsData = widget.items.map((item) {
        return {
          'name': item['productName'],
          'price': item['productPrice'],
          'stats': item['productStats'],
          'color': item['productColor'],
          'warranty': item['productWarranty'],
          'image': item['productImage'],
          'quantity':
              int.tryParse(item['quantity'] ?? '1') ?? 1, // Include quantity
        };
      }).toList();

      // Prepare order data
      final orderData = {
        'customer_name': 'N/A', // Placeholder for backend validation
        'customer_email':
            'n/a@example.com', // Placeholder for backend validation
        'customer_phone': widget.customerPhone,
        'delivery_address': widget.address,
        'products': productsData, // Send as array, not JSON string
        'total_amount': widget.total,
        'currency': 'LKR',
        'status': 'pending',
      };

      // Make API call
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Add authentication token if available
      if (AuthService.token != null) {
        headers['Authorization'] = 'Bearer ${AuthService.token}';
      }

      final response = await http.post(
        Uri.parse(ApiConfig.checkout),
        headers: headers,
        body: jsonEncode(orderData),
      );

      // Close loading dialog
      Navigator.pop(context);

      // Log response for debugging
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      // Check for successful response
      if (response.statusCode >= 200 && response.statusCode < 300) {
        try {
          final responseData = jsonDecode(response.body);

          // Try to get order ID from different possible response structures
          String orderId = 'N/A';
          if (responseData['order'] != null &&
              responseData['order']['id'] != null) {
            orderId = responseData['order']['id'].toString();
          } else if (responseData['id'] != null) {
            orderId = responseData['id'].toString();
          } else if (responseData['order_id'] != null) {
            orderId = responseData['order_id'].toString();
          }

          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            title: 'Order Placed!',
            text:
                'Your order was placed successfully.\nOrder ID: $orderId\nPay on Delivery.',
            confirmBtnText: 'OK',
            onConfirmBtnTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Wrapper()),
                (route) => false,
              );
            },
          );
        } catch (e) {
          // Even if we can't parse the response, the order was successful
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            title: 'Order Placed!',
            text: 'Your order was placed successfully.\nPay on Delivery.',
            confirmBtnText: 'OK',
            onConfirmBtnTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Wrapper()),
                (route) => false,
              );
            },
          );
        }
      } else {
        // Show detailed error for debugging
        String errorMessage = 'Failed to place order. Please try again.';
        try {
          final errorData = jsonDecode(response.body);
          errorMessage =
              'Error ${response.statusCode}: ${errorData['message'] ?? errorData.toString()}';
        } catch (e) {
          errorMessage = 'Error ${response.statusCode}: ${response.body}';
        }

        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Order Failed',
          text: errorMessage,
          confirmBtnText: 'OK',
        );
      }
    } catch (e) {
      // Close loading dialog if still open
      Navigator.pop(context);

      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Error',
        text: 'An error occurred: ${e.toString()}',
        confirmBtnText: 'OK',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        title: const Center(
          child: Text(
            "Checkout",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Color(0xFF0A4C8A),
              fontFamily: "Nano",
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Customer Information:",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 18,
                        color: textColor?.withOpacity(0.7),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.customerPhone,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Delivery Address:",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(widget.address, style: theme.textTheme.bodyMedium),
            ),

            const SizedBox(height: 10),

            Text(
              "Order Summary:",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final product = widget.items[index];

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
                              product["productImage"]!.startsWith('Images/')
                                  ? product["productImage"]!
                                  : 'Images/${product["productImage"]!}',
                              width: 100,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                          ),

                          const SizedBox(width: 20),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  "Qty: ${product["quantity"] ?? '1'}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: textColor?.withOpacity(0.8),
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
                                    color: Color(0xFF0A4C8A),
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
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const Divider(thickness: 1),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Rs ${widget.total.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF0A4C8A),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A4C8A),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => _placeOrder(context),
                child: const Text(
                  "Place The Order",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
