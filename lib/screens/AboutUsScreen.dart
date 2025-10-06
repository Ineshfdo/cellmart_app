// ignore_for_file: sort_child_properties_last
import 'package:cellmart_app/components/InfoSection.dart';
import 'package:cellmart_app/components/MainInfoSection.dart';
import 'package:cellmart_app/components/footer.dart';
import 'package:flutter/material.dart';

class AboutUsscreen extends StatelessWidget {
  const AboutUsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 15, 0, 15),
            child: Text(
              "About CellMart",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: theme.brightness == Brightness.dark
                    ? const Color(0xFF0A4C8A)
                    : const Color(0xFF0A4C8A),
                fontFamily: "Nano",
              ),
            ),
          ),
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainInfoSection(
                  imagePath: "assets/images/store1.jpg",
                  content1:
                      "At CellMart, we provide the latest mobile phones, tablets, and accessories all in one place. Our goal is to make technology accessible, offering high-quality products from trusted brands at competitive prices.",
                  content2:
                      "Our team is passionate about technology and dedicated to helping customers make informed decisions. From smartphones with cutting-edge features to essential accessories like chargers, headphones, and protective cases, we prioritize quality, authenticity, and excellent service in every purchase.",
                ),
                const Divider(),
                Center(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 15, 0, 20),
                    child: Text(
                      "Our Products & Quality",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: textColor,
                        fontFamily: "Nano",
                      ),
                    ),
                  ),
                ),
                MainInfoSection(
                  imagePath: "assets/images/allphones.webp",
                  content1:
                      "At CellMart, we are committed to providing reliable, safe, and high-quality mobile phones and accessories. Each product is carefully selected and tested to meet industry standards, ensuring customer satisfaction and trust.",
                  content2:
                      "We continually update our offerings to reflect new technologies and market trends. Our skilled team supports every customer with knowledge, guidance, and exceptional service, making CellMart a trusted destination for all mobile needs.",
                ),
                const Divider(),
                InfoSection(
                  title: "Our Mission",
                  imagePath: "assets/images/1.jpg",
                  content1:
                      "CellMart’s mission is to redefine the way people shop for mobile phones and accessories. We aim to provide a convenient, reliable, and affordable shopping experience where customers can find the latest devices and essential accessories all in one place.",
                  content2:
                      "We are committed to building trust with our customers by offering transparent pricing, detailed product information, and responsive customer support. Our goal is to make technology accessible and enjoyable for everyone.",
                ),
                Divider(),
                const Footer(),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
    );
  }
}
