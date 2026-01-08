import 'package:cellmart_app/screens/AboutUsScreen.dart';
import 'package:cellmart_app/screens/ContactUsScreen.dart';
import 'package:cellmart_app/screens/CartScreen.dart';
import 'package:cellmart_app/screens/HomeScreen.dart';
import 'package:cellmart_app/screens/ProductsScreen.dart';
import 'package:cellmart_app/screens/SignupScreen.dart';
import 'package:cellmart_app/screens/FavoritesScreen.dart';
import 'package:cellmart_app/screens/loginScreen.dart';
import 'package:cellmart_app/services/auth_service.dart';
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

  // LOGIN & SIGNUP → SLIDE FROM LEFT
  void slideFromLeftNavigate(Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 450),
        pageBuilder: (_, animation, __) => page,
        transitionsBuilder: (_, animation, __, child) {
          final tween = Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeOutCubic));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  //  CART → SLIDE FROM RIGHT
  void slideFromRightNavigate(Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 450),
        pageBuilder: (_, animation, __) => page,
        transitionsBuilder: (_, animation, __, child) {
          final tween = Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeOutCubic));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
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
            // LOGIN & SIGN UP / LOGOUT
            ValueListenableBuilder<bool>(
              valueListenable: AuthService.isLoggedInNotifier,
              builder: (context, isLoggedIn, child) {
                if (isLoggedIn) {
                  return ElevatedButton(
                    onPressed: () {
                      AuthService.logout();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Logged out successfully'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Log Out"),
                  );
                }
                return Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        slideFromLeftNavigate(const LoginScreen());
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
                        slideFromLeftNavigate(const SignUpScreen());
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
                );
              },
            ),

            // CART
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    slideFromRightNavigate(const FavoritesScreen());
                  },
                  child: const Icon(
                    Icons.favorite,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    backgroundColor: const Color.fromARGB(255, 0, 88, 139),
                  ),
                  onPressed: () {
                    slideFromRightNavigate(const CartScreen());
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
