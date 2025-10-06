import 'package:flutter/material.dart';

class MainInfoSection extends StatelessWidget {
  final String imagePath;
  final String content1;
  final String content2;

  const MainInfoSection({
    super.key,
    required this.imagePath,
    required this.content1,
    required this.content2,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 800;
    final isLandscape = size.width > size.height;

    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;

    if (isDesktop || isLandscape) {
      // Desktop Layout
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePath, fit: BoxFit.cover, height: 350),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content1,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    content2,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Mobile Layout
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            content1,
            style: TextStyle(fontSize: 16, height: 1.5, color: textColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            content2,
            style: TextStyle(fontSize: 16, height: 1.5, color: textColor),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
