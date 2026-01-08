import 'package:cellmart_app/screens/ProductDetailScreen.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class productCard extends StatefulWidget {
  final Product product;

  const productCard({super.key, required this.product});

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
        builder: (context) => ProductDetailScreen(product: widget.product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String displayStats = "";
    if (widget.product.ram != null && widget.product.storage != null) {
      displayStats = "${widget.product.ram} - ${widget.product.storage}";
    }

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
              Hero(
                tag: 'product_image_${widget.product.id}',
                child: Image.asset(
                  widget.product.image.startsWith('Images/')
                      ? widget.product.image
                      : 'Images/${widget.product.image}',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image, size: 80, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.product.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              if (displayStats.isNotEmpty)
                Text(
                  displayStats,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              Text(
                "${widget.product.currency} ${widget.product.price}",
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
