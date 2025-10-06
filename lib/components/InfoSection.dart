import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final String imagePath;
  final String content1;
  final String content2;

  const InfoSection({
    super.key,
    required this.title,
    required this.imagePath,
    required this.content1,
    required this.content2,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 800;
    final isLandscape = size.width > size.height;

    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    if (isDesktop || isLandscape) {
      // Landscape Layout
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: textColor,
                fontFamily: "Nano",
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      height: 350,
                    ),
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
                          // ignore: deprecated_member_use
                          color: textColor?.withOpacity(0.9),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        content2,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          // ignore: deprecated_member_use
                          color: textColor?.withOpacity(0.9),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    // Mobile Layout
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: textColor,
              fontFamily: "Nano",
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 1, 16, 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            content1,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              // ignore: deprecated_member_use
              color: textColor?.withOpacity(0.9),
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            content2,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              // ignore: deprecated_member_use
              color: textColor?.withOpacity(0.9),
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
