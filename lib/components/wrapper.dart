import 'package:cellmart_app/screens/AboutUsScreen.dart';
import 'package:cellmart_app/screens/ContactUsScreen.dart';
import 'package:cellmart_app/screens/CartScreen.dart';
import 'package:cellmart_app/screens/HomeScreen.dart';
import 'package:cellmart_app/screens/ProductsScreen.dart';
import 'package:cellmart_app/screens/SignupScreen.dart';
import 'package:cellmart_app/screens/loginScreen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int selectedItem = 0;

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      Homescreen(),
      ProductsScreen(),
      ContactUsScreen(),
      AboutUsscreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? Colors.white : Colors.black,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: isDark ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? Colors.white : Colors.black,
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: isDark ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    backgroundColor: const Color.fromARGB(255, 0, 88, 139),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: screens[selectedItem],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedItem,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email_outlined),
            label: 'Contact Us',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About Us',
          ),
        ],
        onTap: (value) => setState(() => selectedItem = value),
      ),
    );
  }
}
