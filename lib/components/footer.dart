import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 800;

    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    final textColor = Theme.of(context).textTheme.bodyMedium?.color;
    final headingStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
      color: textColor,
    );

    return Container(
      color: bgColor,
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "CellMart",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0A4C8A),
              ),
            ),
          ),
          const SizedBox(height: 24),

          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Quick Details", style: headingStyle),
                          const SizedBox(height: 8),
                          Text("Home", style: TextStyle(color: textColor)),
                          Text("Browse", style: TextStyle(color: textColor)),
                          Text("Top Reads", style: TextStyle(color: textColor)),
                          Text(
                            "My Account",
                            style: TextStyle(color: textColor),
                          ),
                          Text(
                            "Contact Us",
                            style: TextStyle(color: textColor),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Resources", style: headingStyle),
                          const SizedBox(height: 8),
                          Text(
                            "Help Center",
                            style: TextStyle(color: textColor),
                          ),
                          Text("FAQs", style: TextStyle(color: textColor)),
                          Text(
                            "Privacy Policy",
                            style: TextStyle(color: textColor),
                          ),
                          Text(
                            "Terms of Use",
                            style: TextStyle(color: textColor),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CellMart (Pvt) Ltd", style: headingStyle),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: textColor,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "351 B.E, Katuneriya 00300",
                                style: TextStyle(color: textColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone, size: 16, color: textColor),
                              const SizedBox(width: 4),
                              Text(
                                "Hotline: 0758690018",
                                style: TextStyle(color: textColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_android,
                                size: 16,
                                color: textColor,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "Phone: 0312250777",
                                style: TextStyle(color: textColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.email, size: 16, color: textColor),
                              const SizedBox(width: 4),
                              Text(
                                "Email: info@cellmart.lk",
                                style: TextStyle(color: textColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              // Mobile stacked Column
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quick Details", style: headingStyle),
                        const SizedBox(height: 8),
                        Text(
                          "Navigate through our main sections",
                          style: TextStyle(color: textColor),
                        ),
                        Text(
                          "Discover all available content options",
                          style: TextStyle(color: textColor),
                        ),
                        Text(
                          "Explore trending and top articles",
                          style: TextStyle(color: textColor),
                        ),
                        Text(
                          "Manage your personal user account",
                          style: TextStyle(color: textColor),
                        ),
                        Text(
                          "Get in touch with us",
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Resources", style: headingStyle),
                        const SizedBox(height: 8),
                        Text(
                          "Find answers in help center",
                          style: TextStyle(color: textColor),
                        ),
                        Text(
                          "Frequently asked questions answered here",
                          style: TextStyle(color: textColor),
                        ),
                        Text(
                          "Read our complete privacy policy",
                          style: TextStyle(color: textColor),
                        ),
                        Text(
                          "Understand the terms of use",
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CellMart (Pvt) Ltd", style: headingStyle),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 16, color: textColor),
                            const SizedBox(width: 4),
                            Text(
                              "351 B.E, Katuneriya 00300",
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.phone, size: 16, color: textColor),
                            const SizedBox(width: 4),
                            Text(
                              "Hotline: 0758690018",
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone_android,
                              size: 16,
                              color: textColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Phone: 0312250777",
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.email, size: 16, color: textColor),
                            const SizedBox(width: 4),
                            Text(
                              "Email: info@cellmart.lk",
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

          const SizedBox(height: 24),

          Center(
            child: Text(
              "© 2025 CellMart (Pvt) Ltd. All rights reserved.",
              style: TextStyle(
                fontSize: 12,
                // ignore: deprecated_member_use
                color: textColor?.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
