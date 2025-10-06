import 'package:cellmart_app/components/InfoSection.dart';
import 'package:cellmart_app/components/footer.dart';
import 'package:cellmart_app/components/productCard.dart';
import 'package:flutter/material.dart';
import 'package:cellmart_app/components/PhotoAnimation.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> products = [
    {
      "imagepath": "assets/images/15promax.jpg",
      "name": "iPhone 15 Pro",
      "stats": "8GB - 256GB",
      "price": "Rs 300,000",
      "description":
          "The iPhone 15 Pro, launched in September 2023, is Apple’s flagship smartphone featuring a 6.7-inch Super Retina XDR OLED display with 2796 x 1290 resolution at 460 ppi, ProMotion technology up to 120Hz, HDR support, and an Always-On display. Its titanium frame ensures a lightweight yet durable design. Powered by the A17 Pro chip, it delivers exceptional performance and supports Apple’s AI features. The camera system includes a 48MP main lens, 12MP ultra-wide, and 12MP telephoto with 5x optical zoom, enhanced by a LiDAR Scanner for AR experiences. It has a 4441 mAh battery with fast 20W charging, 15W MagSafe wireless charging, and reverse wireless charging. Running iOS 17 (upgradable to iOS 18), it includes a customizable Action Button, Visual Intelligence support, and storage options of 256GB, 512GB, and 1TB, making it a premium device for users seeking cutting-edge performance, photography, and sleek design.",
    },
    {
      "imagepath": "assets/images/a04s.png",
      "name": "Samsung A04s",
      "stats": "4GB - 64GB",
      "price": "Rs 55,000",
      "description":
          "The Samsung Galaxy A04s is an entry-level smartphone featuring a 6.5-inch PLS LCD display with a 90Hz refresh rate. It is powered by the Exynos 850 chipset, coupled with 3GB or 4GB RAM, and offers internal storage options of 32GB, 64GB, or 128GB, expandable via microSD. The triple rear camera setup includes a 50MP main sensor, a 2MP macro lens, and a 2MP depth sensor, while the front camera is a 5MP shooter. The device is equipped with a 5,000mAh battery, supporting 15W fast charging. It runs on Android 12 with Samsung's One UI 4.1 Core. Connectivity options include 4G LTE, Wi-Fi, Bluetooth 5.0, and a USB Type-C port. The A04s is available in multiple colors and offers a reliable performance for budget-conscious users.",
    },
    {
      "imagepath": "assets/images/a15.jpg",
      "name": "Samsung A15",
      "stats": "6GB - 128GB",
      "price": "Rs 70,000",
      "description":
          "The Samsung Galaxy A15 5G is a mid-range smartphone that boasts a 6.5-inch Super AMOLED display with a 90Hz refresh rate. It is powered by the Exynos 1330 processor, paired with 4GB or 6GB RAM, and offers internal storage options of 64GB or 128GB, expandable via microSD. The triple rear camera system includes a 50MP main sensor, a 5MP ultra-wide lens, and a 2MP macro sensor, while the front camera is a 13MP shooter. The device is equipped with a 5,000mAh battery, supporting 15W fast charging. It runs on Android 13 with Samsung's One UI 5.1. Connectivity features include 5G support, Wi-Fi 5, Bluetooth 5.2, and a USB Type-C port. The A15 5G offers a balanced performance with a focus on display quality and camera capabilities.",
    },
    {
      "imagepath": "assets/images/a25.jpg",
      "name": "Samsung A25",
      "stats": "6GB - 128GB",
      "price": "Rs 50,000",
      "description":
          "The Samsung Galaxy A25 5G is a mid-range smartphone featuring a 6.5-inch Super AMOLED display with a 120Hz refresh rate. It is powered by the Exynos 1280 chipset, coupled with 6GB or 8GB RAM, and offers internal storage options of 128GB or 256GB, expandable via microSD. The triple rear camera setup includes a 50MP main sensor, an 8MP ultra-wide lens, and a 5MP macro sensor, while the front camera is a 13MP shooter. The device is equipped with a 5,000mAh battery, supporting 25W fast charging. It runs on Android 14 with Samsung's One UI 6.0. Connectivity options include 5G support, Wi-Fi 6, Bluetooth 5.2, and a USB Type-C port. The A25 5G offers a smooth user experience with enhanced performance and camera capabilities.",
    },
    {
      "imagepath": "assets/images/a35.jpg",
      "name": "Samsung A35",
      "stats": "8GB - 256GB",
      "price": "Rs 70,000",
      "description":
          "The Samsung Galaxy A35 5G is a mid-range smartphone that features a 6.5-inch Super AMOLED display with a 120Hz refresh rate. It is powered by the Exynos 1380 chipset, coupled with 6GB or 8GB RAM, and offers internal storage options of 128GB or 256GB, expandable via microSD. The triple rear camera system includes a 50MP main sensor, an 8MP ultra-wide lens, and a 5MP macro sensor, while the front camera is a 13MP shooter. The device is equipped with a 5,000mAh battery, supporting 25W fast charging. It runs on Android 14 with Samsung's One UI 6.0. Connectivity features include 5G support, Wi-Fi 6, Bluetooth 5.2, and a USB Type-C port. The A35 5G offers a premium display and camera experience within the mid-range segment.",
    },
    {
      "imagepath": "assets/images/a55.jpg",
      "name": "Samsung A55",
      "stats": "8GB - 256GB",
      "price": "Rs 90,000",
      "description":
          "The Samsung Galaxy A55 5G is a premium mid-range smartphone that boasts a 6.6-inch Super AMOLED display with a 120Hz refresh rate. It is powered by the Exynos 1380 processor, paired with 8GB RAM, and offers internal storage options of 128GB or 256GB, expandable via microSD. The triple rear camera setup includes a 50MP main sensor with OIS, a 12MP ultra-wide lens, and a 5MP macro sensor, while the front camera is a 32MP shooter. The device is equipped with a 5,000mAh battery, supporting 25W fast charging. It runs on Android 14 with Samsung's One UI 6.0. Connectivity options include 5G support, Wi-Fi 6, Bluetooth 5.3, and a USB Type-C port. The A55 5G offers a sleek design, enhanced camera capabilities, and a smooth user experience.",
    },
    {
      "imagepath": "assets/images/airpods3.png",
      "name": "AirPods 3",
      "stats": "Noise Cancelling",
      "price": "Rs 45,000",
      "description":
          "The Apple AirPods (3rd generation) are true wireless earbuds featuring a contoured design with a shorter stem. They are equipped with the H1 chip, enabling features like 'Hey Siri' voice activation and adaptive EQ. The earbuds offer up to 6 hours of listening time on a single charge and up to 30 hours with the charging case. They support spatial audio with dynamic head tracking and are sweat and water-resistant with an IPX4 rating. The charging case is compatible with MagSafe and Qi-certified chargers. Connectivity is provided via Bluetooth 5.0. The AirPods (3rd generation) deliver high-quality audio and seamless integration with Apple devices.",
    },
    {
      "imagepath": "assets/images/airpodspro.png",
      "name": "AirPods Pro 2",
      "stats": "Noise Cancelling",
      "price": "Rs 65,000",
      "description":
          "The Apple AirPods Pro (2nd generation) are premium true wireless earbuds featuring active noise cancellation and a custom H2 chip for enhanced audio performance. They offer up to 6 hours of listening time with noise cancellation enabled and up to 30 hours with the charging case. The earbuds support spatial audio with dynamic head tracking and feature a vent system for pressure equalization. They are sweat and water-resistant with an IPX4 rating. The charging case includes Find My capabilities, a built-in speaker, and supports MagSafe and Lightning charging. Connectivity is provided via Bluetooth 5.3. The AirPods Pro (2nd generation) deliver immersive sound and advanced features for an enhanced listening experience.",
    },
    {
      "imagepath": "assets/images/Apple-iPhone-15-3.png",
      "name": "iPhone 15",
      "stats": "8GB - 128GB",
      "price": "Rs 250,000",
      "description":
          "The Apple iPhone 15 is a flagship smartphone featuring a 6.1-inch Super Retina XDR display with Dynamic Island and Always-On capabilities. It is powered by the A16 Bionic chip, providing high performance and efficiency. The dual rear camera system includes a 48MP main sensor and a 12MP ultra-wide lens, while the front camera is a 12MP shooter. The device supports 5G connectivity and offers storage options of 128GB, 256GB, and 512GB. It runs on iOS 17 and is equipped with Face ID for secure authentication. The iPhone 15 offers a sleek design, advanced camera capabilities, and seamless integration with the Apple ecosystem.",
    },
    {
      "imagepath": "assets/images/buds2pro.png",
      "name": "Samsung Buds",
      "stats": "Noise Cancelling",
      "price": "Rs 30,000",
      "description":
          "The Samsung Galaxy Buds are premium true wireless earbuds featuring active noise cancellation and a compact design. They are equipped with 10mm woofers and 5.3mm tweeters for high-quality audio performance. The earbuds offer up to 5 hours of listening time with noise cancellation enabled and up to 18 hours with the charging case. They are sweat and water-resistant with an IPX7 rating. The charging case supports wireless charging and includes a built-in speaker for Find My capabilities. Connectivity is provided via Bluetooth 5.3. The Galaxy Buds deliver immersive sound and advanced features for an enhanced listening experience.",
    },
    {
      "imagepath": "assets/images/iPhone15black.png",
      "name": "iPhone 15",
      "stats": "8GB - 128GB",
      "price": "Rs 210,000",
      "description":
          "The Apple iPhone 15 shares the same specifications as the standard iPhone 15, with the primary difference being the color option. It features a 6.1-inch Super Retina XDR display with Dynamic Island and Always-On capabilities. Powered by the A16 Bionic chip, it offers high performance and efficiency. The dual rear camera system includes a 48MP main sensor and a 12MP ultra-wide lens, while the front camera is a 12MP shooter. The device supports 5G connectivity and offers storage options of 128GB, 256GB, and 512GB. It runs on iOS 17 and is equipped with Face ID for secure authentication. The iPhone 15 offers a sleek design, advanced camera capabilities, and seamless integration with the Apple ecosystem.",
    },
    {
      "imagepath": "assets/images/nothingear2.jpg",
      "name": "Nothing Ear 2",
      "stats": "Wireless",
      "price": "Rs 25,000",
      "description":
          "The Nothing Ear (2) is a premium pair of true wireless earbuds that combine cutting-edge audio technology with a distinctive design. Each earbud weighs just 4.5 grams, ensuring a comfortable fit for extended listening sessions. They feature 11.6mm dynamic drivers with a graphene and polyurethane diaphragm, delivering rich sound quality. Supporting LHDC 5.0 codec, they offer 24-bit Hi-Res Audio on compatible devices. Active Noise Cancellation (ANC) and a Transparency mode allow users to control ambient sound levels. The earbuds provide up to 6 hours of playback on a single charge, with the charging case extending total battery life to 36 hours. The case also supports wireless charging. The Nothing Ear (2) is compatible with both iOS and Android devices, offering seamless connectivity and a unique design that stands out in the wireless audio market.",
    },
    {
      "imagepath": "assets/images/s25.jpg",
      "name": "Samsung S25",
      "stats": "8GB - 256GB",
      "price": "Rs 280,000",
      "description":
          "The Samsung Galaxy S25 is the latest flagship smartphone in Samsung's S series, featuring a 6.2-inch Dynamic LTPO AMOLED 2X display with a 120Hz refresh rate and HDR10+ support, delivering vibrant visuals. Powered by the Qualcomm Snapdragon Elite 8 processor, it ensures smooth performance for multitasking and gaming. The rear camera system includes a 200MP primary sensor, offering high-resolution photography, while the 12MP front camera caters to selfies and video calls. The device is equipped with a 3900mAh battery, supporting fast charging to keep you powered throughout the day. Running on Android 15 with One UI 7.0, it introduces AI-enhanced features for a personalized user experience. The Galaxy S25 also boasts an ultrasonic in-display fingerprint sensor for secure unlocking. With its sleek design and advanced features, the Galaxy S25 sets a new standard for smartphones.",
    },
    {
      "imagepath": "assets/images/zflip4.jpg",
      "name": "Samsung Flip 4",
      "stats": "8GB - 256GB",
      "price": "Rs 340,000",
      "description":
          "The Samsung Galaxy Z Flip 4 is a compact foldable smartphone that combines style with functionality. It features a 6.7-inch Dynamic AMOLED 2X main display with a 120Hz refresh rate, providing smooth visuals. The external 1.9-inch Super AMOLED display allows for quick notifications and interactions without unfolding the device. Powered by the Qualcomm Snapdragon 8+ Gen 1 processor, it delivers efficient performance. The dual rear camera setup includes a 12MP primary sensor and a 12MP ultra-wide sensor, enabling versatile photography. The 3700mAh battery supports fast charging, ensuring the device stays powered throughout the day. Running on Android 12 with One UI, it offers a user-friendly interface. The Galaxy Z Flip 4's foldable design makes it a unique and portable option for users seeking innovation in their smartphones.",
    },
    {
      "imagepath": "assets/images/zflip5.jpg",
      "name": "Samsung Flip 5",
      "stats": "8GB - 256GB",
      "price": "Rs 360,000",
      "description":
          "The Samsung Galaxy Z Flip 5 builds upon its predecessor with enhanced features and design. It boasts a 6.7-inch Dynamic AMOLED 2X main display with a 120Hz refresh rate, offering vibrant and smooth visuals. The external 3.4-inch Super AMOLED cover screen provides more space for notifications and quick interactions. Powered by the Qualcomm Snapdragon 8 Gen 2 processor, it ensures top-tier performance. The dual rear camera system includes a 12MP primary sensor and a 12MP ultra-wide sensor, delivering high-quality photography. The 3700mAh battery supports fast charging, keeping the device powered throughout the day. Running on Android 14 with One UI, it offers a refined user experience. The Galaxy Z Flip 5's foldable design and improved features make it a standout choice for users seeking innovation and style.",
    },
    {
      "imagepath": "assets/images/zfold3.jpg",
      "name": "Samsung Fold 3",
      "stats": "12GB - 512GB",
      "price": "Rs 400,000",
      "description":
          "The Samsung Galaxy Z Fold 3 is a revolutionary foldable smartphone that offers a tablet-like experience in a compact form. It features a 7.6-inch Dynamic AMOLED 2X main display with a 120Hz refresh rate, providing immersive visuals. The 6.2-inch Super AMOLED cover screen allows for quick interactions without unfolding the device. Powered by the Qualcomm Snapdragon 888 processor, it delivers robust performance. The triple rear camera setup includes a 12MP wide, 12MP ultra-wide, and 12MP telephoto sensors, offering versatile photography options. The 4400mAh battery supports fast charging, ensuring the device stays powered throughout the day. Running on Android 11 with One UI, it offers a user-friendly interface. The Galaxy Z Fold 3's foldable design and advanced features cater to users seeking a versatile and innovative smartphone experience.",
    },
    {
      "imagepath": "assets/images/zfold4.png",
      "name": "Samsung Fold 4",
      "stats": "12GB - 512GB",
      "price": "Rs 480,000",
      "description":
          "The Samsung Galaxy Z Fold 4 is a premium foldable smartphone designed to offer a tablet-like experience in a pocketable form factor, featuring a 7.6-inch QXGA+ Dynamic AMOLED 2X main display with 2176 x 1812 resolution and an adaptive 120Hz refresh rate for smooth and vibrant visuals. Its 6.2-inch HD+ Dynamic AMOLED 2X cover screen with 2316 x 904 resolution and 120Hz refresh rate allows quick access to notifications and apps without unfolding the device. Powered by the Qualcomm Snapdragon 8+ Gen 1 processor and 12GB RAM, the Fold 4 ensures high performance for multitasking, gaming, and productivity. Storage options include 256GB, 512GB, or 1TB, though there is no microSD expansion. The triple rear camera system comprises a 50MP wide sensor, a 12MP ultra-wide sensor, and a 10MP telephoto lens with 3x optical zoom, while the cover camera is 10MP and an under-display 4MP front camera is embedded within the main screen. A 4400mAh dual-cell battery with 25W fast charging, 15W wireless charging, and 4.5W reverse wireless charging ensures all-day use. Running on Android 12L with One UI 4.1.1, the device is optimized for large-screen multitasking, offering features like taskbar and drag-and-drop functionality. With IPX8 water resistance, Gorilla Glass Victus+ protection, and an Armor Aluminum frame, the Galaxy Z Fold 4 combines durability with innovation, making it a top choice for power users seeking the ultimate foldable smartphone experience.",
    },
    {
      "imagepath": "assets/images/zfold5.jpg",
      "name": "Samsung Fold 5",
      "stats": "12GB - 512GB",
      "price": "Rs 520,000",
      "description":
          "The Samsung Galaxy Z Fold 5 is a premium foldable smartphone that redefines multitasking and productivity. It features a 7.6-inch Dynamic AMOLED 2X main display with a 120Hz refresh rate, delivering stunning visuals. The 6.2-inch Super AMOLED cover screen also supports a 120Hz refresh rate, allowing seamless interactions without unfolding the device. Powered by the Qualcomm Snapdragon 8 Gen 2 processor, it ensures exceptional performance. The triple rear camera setup includes a 50MP primary sensor, a 12MP ultra-wide lens, and a 10MP telephoto sensor with 3x optical zoom. The 4400mAh battery supports 25W fast charging and wireless charging, keeping the device powered throughout the day. Running on Android 14 with One UI, it offers advanced multitasking capabilities, including split-screen and drag-and-drop functionality. The Galaxy Z Fold 5 combines sleek design with powerful features, making it an ideal choice for users seeking a versatile and innovative smartphone.",
    },
  ];
  late List<Map<String, String>> _filteredProducts;

  @override
  void initState() {
    super.initState();
    _filteredProducts = List.from(products);
  }

  void _searchProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProducts = List.from(products);
      } else {
        _filteredProducts = products
            .where(
              (product) =>
                  product['name']!.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine number of columns based on screen width
    int crossAxisCount = 3;
    if (screenWidth >= 1200) {
      crossAxisCount = 8;
    } else if (screenWidth >= 800) {
      crossAxisCount = 5;
    }

    // Calculate childAspectRatio dynamically for spacing
    double childAspectRatio = (screenWidth / crossAxisCount) / 280;

    // Use theme colors
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    final inputFillColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[800]
        : Colors.grey[200];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 15, 10, 0),
            child: Text(
              "CellMart",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF0A4C8A),
                fontFamily: "Nano",
              ),
            ),
          ),
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1),
            SizedBox(height: 300, child: PhotoAnimation()),

            const Divider(),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                onChanged: _searchProducts,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "Search for a product...",
                  // ignore: deprecated_member_use
                  hintStyle: TextStyle(color: textColor?.withOpacity(0.6)),
                  prefixIcon: Icon(Icons.search, color: textColor),
                  filled: true,
                  fillColor: inputFillColor,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Products Grid
            _filteredProducts.isEmpty
                ? Center(
                    child: Text(
                      "No products found",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 14,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return productCard(
                        imagepath: product['imagepath']!,
                        name: product['name']!,
                        stats: product['stats']!,
                        price: product['price']!,
                        description: product['description']!,
                      );
                    },
                  ),

            const Divider(),

            InfoSection(
              title: "Why You Chose CellMart",
              imagePath: "assets/images/allphones.webp",
              content1:
                  "At CellMart, we prioritize our customers above all. Whether you have a question about our products, need assistance with an order, or want to provide feedback, we are here to help.",
              content2:
                  "You can reach out to us via email, phone, or through our social media channels. We value communication and are always open to hearing from you.",
            ),
            const Divider(),

            const Footer(),
          ],
        ),
      ),
    );
  }
}
