import 'package:cellmart_app/screens/ProductDetailScreen.dart';
import 'package:flutter/material.dart';

class productCard extends StatefulWidget {
  final String imagepath;
  final String name;
  final String stats;
  final String price;
  final String description;

  const productCard({
    super.key,
    required this.imagepath,
    required this.name,
    required this.stats,
    required this.price,
    required this.description,
  });

  @override
  State<productCard> createState() => _productCardState();
}

class _productCardState extends State<productCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _tapController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _tapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 150),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.92,
    ).animate(CurvedAnimation(parent: _tapController, curve: Curves.easeInOut));

    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.6,
    ).animate(CurvedAnimation(parent: _tapController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _tapController.dispose();
    super.dispose();
  }

  Future<void> _onTap(BuildContext context) async {
    // Animate down
    await _tapController.forward();
    // Animate back up
    await _tapController.reverse();
    // Navigate after animation finishes
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(
          imagepath: widget.imagepath,
          name: widget.name,
          stats: widget.stats,
          price: widget.price,
          description: widget.description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: AnimatedBuilder(
        animation: _tapController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Opacity(opacity: _fadeAnimation.value, child: child),
          );
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Column(
            children: [
              Image.asset(widget.imagepath, width: 120, fit: BoxFit.contain),
              const SizedBox(height: 4),
              Text(
                widget.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Text(
                widget.stats,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                widget.price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
