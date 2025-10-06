import 'package:cellmart_app/components/footer.dart';
import 'package:cellmart_app/components/productCard.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> products = [
    {
      "imagepath": "assets/images/15promax.jpg",
      "name": "iPhone 15 Pro",
      "stats": "8GB - 256GB",
      "price": "Rs 300,000",
      "category": "iPhone",
      "description":
          "The iPhone 15 Pro, launched in September 2023, is Apple’s flagship smartphone featuring a 6.7-inch Super Retina XDR OLED display with 2796 x 1290 resolution at 460 ppi, ProMotion technology up to 120Hz, HDR support, and an Always-On display. Its titanium frame ensures a lightweight yet durable design. Powered by the A17 Pro chip, it delivers exceptional performance and supports Apple’s AI features. The camera system includes a 48MP main lens, 12MP ultra-wide, and 12MP telephoto with 5x optical zoom, enhanced by a LiDAR Scanner for AR experiences. It has a 4441 mAh battery with fast 20W charging, 15W MagSafe wireless charging, and reverse wireless charging. Running iOS 17 (upgradable to iOS 18), it includes a customizable Action Button, Visual Intelligence support, and storage options of 256GB, 512GB, and 1TB, making it a premium device for users seeking cutting-edge performance, photography, and sleek design.",
    },
    {
      "imagepath": "assets/images/a04s.png",
      "name": "Samsung A04s",
      "stats": "4GB - 64GB",
      "price": "Rs 55,000",
      "category": "Samsung",
      "description":
          "The Samsung Galaxy A04s is an entry-level smartphone featuring a 6.5-inch PLS LCD display with a 90Hz refresh rate. It is powered by the Exynos 850 chipset, coupled with 3GB or 4GB RAM, and offers internal storage options of 32GB, 64GB, or 128GB, expandable via microSD. The triple rear camera setup includes a 50MP main sensor, a 2MP macro lens, and a 2MP depth sensor, while the front camera is a 5MP shooter. The device is equipped with a 5,000mAh battery, supporting 15W fast charging. It runs on Android 12 with Samsung's One UI 4.1 Core. Connectivity options include 4G LTE, Wi-Fi, Bluetooth 5.0, and a USB Type-C port. The A04s is available in multiple colors and offers a reliable performance for budget-conscious users.",
    },
    {
      "imagepath": "assets/images/a15.jpg",
      "name": "Samsung A15",
      "stats": "6GB - 128GB",
      "price": "Rs 70,000",
      "category": "Samsung",
      "description":
          "The Samsung Galaxy A15 5G is a mid-range smartphone that boasts a 6.5-inch Super AMOLED display with a 90Hz refresh rate. It is powered by the Exynos 1330 processor, paired with 4GB or 6GB RAM, and offers internal storage options of 64GB or 128GB, expandable via microSD. The triple rear camera system includes a 50MP main sensor, a 5MP ultra-wide lens, and a 2MP macro sensor, while the front camera is a 13MP shooter. The device is equipped with a 5,000mAh battery, supporting 15W fast charging. It runs on Android 13 with Samsung's One UI 5.1. Connectivity features include 5G support, Wi-Fi 5, Bluetooth 5.2, and a USB Type-C port. The A15 5G offers a balanced performance with a focus on display quality and camera capabilities.",
    },
    {
      "imagepath": "assets/images/a25.jpg",
      "name": "Samsung A25",
      "stats": "6GB - 128GB",
      "price": "Rs 50,000",
      "category": "Samsung",
      "description":
          "The Samsung Galaxy A25 5G is a mid-range smartphone featuring a 6.5-inch Super AMOLED display with a 120Hz refresh rate. It is powered by the Exynos 1280 chipset, coupled with 6GB or 8GB RAM, and offers internal storage options of 128GB or 256GB, expandable via microSD. The triple rear camera setup includes a 50MP main sensor, an 8MP ultra-wide lens, and a 5MP macro sensor, while the front camera is a 13MP shooter. The device is equipped with a 5,000mAh battery, supporting 25W fast charging. It runs on Android 14 with Samsung's One UI 6.0. Connectivity options include 5G support, Wi-Fi 6, Bluetooth 5.2, and a USB Type-C port. The A25 5G offers a smooth user experience with enhanced performance and camera capabilities.",
    },
    {
      "imagepath": "assets/images/a35.jpg",
      "name": "Samsung A35",
      "stats": "8GB - 256GB",
      "price": "Rs 70,000",
      "category": "Samsung",
      "description":
          "The Samsung Galaxy A35 5G is a mid-range smartphone that features a 6.5-inch Super AMOLED display with a 120Hz refresh rate. It is powered by the Exynos 1380 chipset, coupled with 6GB or 8GB RAM, and offers internal storage options of 128GB or 256GB, expandable via microSD. The triple rear camera system includes a 50MP main sensor, an 8MP ultra-wide lens, and a 5MP macro sensor, while the front camera is a 13MP shooter. The device is equipped with a 5,000mAh battery, supporting 25W fast charging. It runs on Android 14 with Samsung's One UI 6.0. Connectivity features include 5G support, Wi-Fi 6, Bluetooth 5.2, and a USB Type-C port. The A35 5G offers a premium display and camera experience within the mid-range segment.",
    },
    {
      "imagepath": "assets/images/a55.jpg",
      "name": "Samsung A55",
      "stats": "8GB - 256GB",
      "price": "Rs 90,000",
      "category": "Samsung",
      "description":
          "The Samsung Galaxy A55 5G is a premium mid-range smartphone that boasts a 6.6-inch Super AMOLED display with a 120Hz refresh rate. It is powered by the Exynos 1380 processor, paired with 8GB RAM, and offers internal storage options of 128GB or 256GB, expandable via microSD. The triple rear camera setup includes a 50MP main sensor with OIS, a 12MP ultra-wide lens, and a 5MP macro sensor, while the front camera is a 32MP shooter. The device is equipped with a 5,000mAh battery, supporting 25W fast charging. It runs on Android 14 with Samsung's One UI 6.0. Connectivity options include 5G support, Wi-Fi 6, Bluetooth 5.3, and a USB Type-C port. The A55 5G offers a sleek design, enhanced camera capabilities, and a smooth user experience.",
    },
    {
      "imagepath": "assets/images/airpods3.png",
      "name": "AirPods 3",
      "stats": "Noise Cancelling",
      "price": "Rs 45,000",
      "category": "Audio",
      "description":
          "The Apple AirPods (3rd generation) are true wireless earbuds featuring a contoured design with a shorter stem. They are equipped with the H1 chip, enabling features like 'Hey Siri' voice activation and adaptive EQ. The earbuds offer up to 6 hours of listening time on a single charge and up to 30 hours with the charging case. They support spatial audio with dynamic head tracking and are sweat and water-resistant with an IPX4 rating. The charging case is compatible with MagSafe and Qi-certified chargers. Connectivity is provided via Bluetooth 5.0. The AirPods (3rd generation) deliver high-quality audio and seamless integration with Apple devices.",
    },
    {
      "imagepath": "assets/images/airpodspro.png",
      "name": "AirPods Pro 2",
      "stats": "Noise Cancelling",
      "price": "Rs 65,000",
      "category": "Audio",
      "description":
          "The Apple AirPods Pro (2nd generation) are premium true wireless earbuds featuring active noise cancellation and a custom H2 chip for enhanced audio performance. They offer up to 6 hours of listening time with noise cancellation enabled and up to 30 hours with the charging case. The earbuds support spatial audio with dynamic head tracking and feature a vent system for pressure equalization. They are sweat and water-resistant with an IPX4 rating. The charging case includes Find My capabilities, a built-in speaker, and supports MagSafe and Lightning charging. Connectivity is provided via Bluetooth 5.3. The AirPods Pro (2nd generation) deliver immersive sound and advanced features for an enhanced listening experience.",
    },
    {
      "imagepath": "assets/images/Apple-iPhone-15-3.png",
      "name": "iPhone 15",
      "stats": "8GB - 128GB",
      "price": "Rs 250,000",
      "category": "iPhone",
      "description":
          "The Apple iPhone 15 is a flagship smartphone featuring a 6.1-inch Super Retina XDR display with Dynamic Island and Always-On capabilities. It is powered by the A16 Bionic chip, providing high performance and efficiency. The dual rear camera system includes a 48MP main sensor and a 12MP ultra-wide lens, while the front camera is a 12MP shooter. The device supports 5G connectivity and offers storage options of 128GB, 256GB, and 512GB. It runs on iOS 17 and is equipped with Face ID for secure authentication. The iPhone 15 offers a sleek design, advanced camera capabilities, and seamless integration with the Apple ecosystem.",
    },
    {
      "imagepath": "assets/images/buds2pro.png",
      "name": "Samsung Buds",
      "stats": "Noise Cancelling",
      "price": "Rs 30,000",
      "category": "Audio",
      "description":
          "The Samsung Galaxy Buds 2 Pro are premium true wireless earbuds featuring active noise cancellation and a compact design. They are equipped with 10mm woofers and 5.3mm tweeters for high-quality audio performance. The earbuds offer up to 5 hours of listening time with noise cancellation enabled and up to 18 hours with the charging case. They are sweat and water-resistant with an IPX7 rating. The charging case supports wireless charging and includes a built-in speaker for Find My capabilities. Connectivity is provided via Bluetooth 5.3. The Galaxy Buds 2 Pro deliver immersive sound and advanced features for an enhanced listening experience.",
    },
    {
      "imagepath": "assets/images/iPhone15black.png",
      "name": "iPhone 15",
      "stats": "8GB - 128GB",
      "price": "Rs 210,000",
      "category": "iPhone",
      "description":
          "The Apple iPhone 15 (Black) shares the same specifications as the standard iPhone 15, with the primary difference being the color option. It features a 6.1-inch Super Retina XDR display with Dynamic Island and Always-On capabilities. Powered by the A16 Bionic chip, it offers high performance and efficiency. The dual rear camera system includes a 48MP main sensor and a 12MP ultra-wide lens, while the front camera is a 12MP shooter. The device supports 5G connectivity and offers storage options of 128GB, 256GB, and 512GB. It runs on iOS 17 and is equipped with Face ID for secure authentication. The iPhone 15 (Black) offers a sleek design, advanced camera capabilities, and seamless integration with the Apple ecosystem.",
    },
    {
      "imagepath": "assets/images/nothingear2.jpg",
      "name": "Nothing Ear 2",
      "stats": "Wireless",
      "price": "Rs 25,000",
      "category": "Audio",
      "description":
          "The Nothing Ear (2) is a premium pair of true wireless earbuds that combine cutting-edge audio technology with a distinctive design. Each earbud weighs just 4.5 grams, ensuring a comfortable fit for extended listening sessions. They feature 11.6mm dynamic drivers with a graphene and polyurethane diaphragm, delivering rich sound quality. Supporting LHDC 5.0 codec, they offer 24-bit Hi-Res Audio on compatible devices. Active Noise Cancellation (ANC) and a Transparency mode allow users to control ambient sound levels. The earbuds provide up to 6 hours of playback on a single charge, with the charging case extending total battery life to 36 hours. The case also supports wireless charging. The Nothing Ear (2) is compatible with both iOS and Android devices, offering seamless connectivity and a unique design that stands out in the wireless audio market.",
    },
    {
      "imagepath": "assets/images/s25.jpg",
      "name": "Samsung S25",
      "stats": "8GB - 256GB",
      "price": "Rs 280,000",
      "category": "Samsung",
      "description":
          "The Samsung Galaxy S25 is the latest flagship smartphone in Samsung's S series, featuring a 6.2-inch Dynamic LTPO AMOLED 2X display with a 120Hz refresh rate and HDR10+ support, delivering vibrant visuals. Powered by the Qualcomm Snapdragon Elite 8 processor, it ensures smooth performance for multitasking and gaming. The rear camera system includes a 200MP primary sensor, offering high-resolution photography, while the 12MP front camera caters to selfies and video calls. The device is equipped with a 3900mAh battery, supporting fast charging to keep you powered throughout the day. Running on Android 15 with One UI 7.0, it introduces AI-enhanced features for a personalized user experience. The Galaxy S25 also boasts an ultrasonic in-display fingerprint sensor for secure unlocking. With its sleek design and advanced features, the Galaxy S25 sets a new standard for smartphones.",
    },
    {
      "imagepath": "assets/images/zflip4.jpg",
      "name": "Samsung Flip 4",
      "stats": "8GB - 256GB",
      "price": "Rs 340,000",
      "category": "Samsung",
      "description":
          "The Samsung Galaxy Z Flip 4 is a compact foldable smartphone that combines style with functionality. It features a 6.7-inch Dynamic AMOLED 2X main display with a 120Hz refresh rate, providing smooth visuals. The external 1.9-inch Super AMOLED display allows for quick notifications and interactions without unfolding the device. Powered by the Qualcomm Snapdragon 8+ Gen 1 processor, it delivers efficient performance. The dual rear camera setup includes a 12MP primary sensor and a 12MP ultra-wide sensor, enabling versatile photography. The 3700mAh battery supports fast charging, ensuring the device stays powered throughout the day. Running on Android 12 with One UI, it offers a user-friendly interface. The Galaxy Z Flip 4's foldable design makes it a unique and portable option for users seeking innovation in their smartphones.",
    },
    {
      "imagepath": "assets/images/zflip5.jpg",
      "name": "Samsung Flip 5",
      "stats": "8GB - 256GB",
      "price": "Rs 360,000",
      "category": "Samsung",
      "description":
          "The Samsung Galaxy Z Flip 5 builds upon its predecessor with enhanced features and design. It boasts a 6.7-inch Dynamic AMOLED 2X main display with a 120Hz refresh rate, offering vibrant and smooth visuals. The external 3.4-inch Super AMOLED cover screen provides more space for notifications and quick interactions. Powered by the Qualcomm Snapdragon 8 Gen 2 processor, it ensures top-tier performance. The dual rear camera system includes a 12MP primary sensor and a 12MP ultra-wide sensor, delivering high-quality photography. The 3700mAh battery supports fast charging, keeping the device powered throughout the day. Running on Android 14 with One UI, it offers a refined user experience. The Galaxy Z Flip 5's foldable design and improved features make it a standout choice for users seeking innovation and style.",
    },
    {
      "imagepath": "assets/images/zfold3.jpg",
      "name": "Samsung Fold 3",
      "stats": "12GB - 512GB",
      "price": "Rs 400,000",
      "category": "Samsung",
      "description":
          "The Samsung Galaxy Z Fold 3 is a revolutionary foldable smartphone that offers a tablet-like experience in a compact form. It features a 7.6-inch Dynamic AMOLED 2X main display with a 120Hz refresh rate, providing immersive visuals. The 6.2-inch Super AMOLED cover screen allows for quick interactions without unfolding the device. Powered by the Qualcomm Snapdragon 888 processor, it delivers robust performance. The triple rear camera setup includes a 12MP wide, 12MP ultra-wide, and 12MP telephoto sensors, offering versatile photography options. The 4400mAh battery supports fast charging, ensuring the device stays powered throughout the day. Running on Android 11 with One UI, it offers a user-friendly interface. The Galaxy Z Fold 3's foldable design and advanced features cater to users seeking a versatile and innovative smartphone experience.",
    },
    {
      "imagepath": "assets/images/zfold4.png",
      "name": "Samsung Fold 4",
      "stats": "12GB - 512GB",
      "price": "Rs 480,000",
      "category": "Samsung",
      "description":
          "The Samsung Galaxy Z Fold 4 is a premium foldable smartphone designed to offer a tablet-like experience in a pocketable form factor, featuring a 7.6-inch QXGA+ Dynamic AMOLED 2X main display with 2176 x 1812 resolution and an adaptive 120Hz refresh rate for smooth and vibrant visuals. Its 6.2-inch HD+ Dynamic AMOLED 2X cover screen with 2316 x 904 resolution and 120Hz refresh rate allows quick access to notifications and apps without unfolding the device. Powered by the Qualcomm Snapdragon 8+ Gen 1 processor and 12GB RAM, the Fold 4 ensures high performance for multitasking, gaming, and productivity. Storage options include 256GB, 512GB, or 1TB, though there is no microSD expansion. The triple rear camera system comprises a 50MP wide sensor, a 12MP ultra-wide sensor, and a 10MP telephoto lens with 3x optical zoom, while the cover camera is 10MP and an under-display 4MP front camera is embedded within the main screen. A 4400mAh dual-cell battery with 25W fast charging, 15W wireless charging, and 4.5W reverse wireless charging ensures all-day use. Running on Android 12L with One UI 4.1.1, the device is optimized for large-screen multitasking, offering features like taskbar and drag-and-drop functionality. With IPX8 water resistance, Gorilla Glass Victus+ protection, and an Armor Aluminum frame, the Galaxy Z Fold 4 combines durability with innovation, making it a top choice for power users seeking the ultimate foldable smartphone experience.",
    },
    {
      "imagepath": "assets/images/zfold5.jpg",
      "name": "Samsung Fold 5",
      "stats": "12GB - 512GB",
      "price": "Rs 520,000",
      "category": "Samsung",
      "description":
          "The Samsung Galaxy Z Fold 5 is a premium foldable smartphone that redefines multitasking and productivity. It features a 7.6-inch Dynamic AMOLED 2X main display with a 120Hz refresh rate, delivering stunning visuals. The 6.2-inch Super AMOLED cover screen also supports a 120Hz refresh rate, allowing seamless interactions without unfolding the device. Powered by the Qualcomm Snapdragon 8 Gen 2 processor, it ensures exceptional performance. The triple rear camera setup includes a 50MP primary sensor, a 12MP ultra-wide lens, and a 10MP telephoto sensor with 3x optical zoom. The 4400mAh battery supports 25W fast charging and wireless charging, keeping the device powered throughout the day. Running on Android 14 with One UI, it offers advanced multitasking capabilities, including split-screen and drag-and-drop functionality. The Galaxy Z Fold 5 combines sleek design with powerful features, making it an ideal choice for users seeking a versatile and innovative smartphone.",
    },

    {
      "imagepath": "assets/images/8.jpg",
      "name": "Google Pixel 8",
      "stats": "8GB - 128GB",
      "price": "Rs 190,000",
      "category": "Google Pixel",
      "description":
          "The Google Pixel 8, launched in October 2023, features a 6.2-inch OLED display with 2400 x 1080 resolution, 120Hz refresh rate, HDR support, and Always-On display. It is powered by the Google Tensor G3 chip, delivering excellent performance for AI-driven features and multitasking. The device includes 8GB RAM with storage options of 128GB and 256GB. The dual rear camera system features a 50MP wide and 12MP ultra-wide lens, optimized with Google’s advanced computational photography. On the front, it has a 10.5MP selfie camera with 4K video support. It runs Android 14 out of the box, ensuring smooth software updates directly from Google. The Pixel 8 includes a 4575 mAh battery supporting 27W wired fast charging and 18W wireless charging. With its compact design, durable aluminum frame, and IP68 water and dust resistance, the Pixel 8 is an excellent choice for users who value performance, camera quality, and long-term software support.",
    },
    {
      "imagepath": "assets/images/8-pro.jpg",
      "name": "Pixel 8 Pro",
      "stats": "12GB - 256GB",
      "price": "Rs 260,000",
      "category": "Google Pixel",
      "description":
          "The Google Pixel 8 Pro, released in October 2023, is Google’s premium flagship featuring a 6.7-inch LTPO OLED display with 3120 x 1440 resolution, adaptive 120Hz refresh rate, HDR support, and Always-On functionality. It is powered by the Google Tensor G3 chip with advanced AI and machine learning optimizations, paired with 12GB of RAM and storage options of 128GB, 256GB, and 512GB. The triple rear camera system includes a 50MP main sensor, 48MP telephoto with 5x optical zoom, and a 48MP ultra-wide, offering cutting-edge computational photography. The 10.5MP front camera supports 4K recording and facial recognition. The Pixel 8 Pro runs on Android 14 with guaranteed 7 years of software updates. Its 5050 mAh battery supports 30W fast wired charging, 23W wireless charging, and reverse wireless charging. With an aluminum frame, matte glass back, and IP68 dust/water resistance, it delivers durability, performance, and best-in-class photography features.",
    },
    {
      "imagepath": "assets/images/9.jpg",
      "name": "Google Pixel 9",
      "stats": "8GB - 128GB",
      "price": "Rs 210,000",
      "category": "Google Pixel",
      "description":
          "The Google Pixel 9, launched in September 2024, comes with a 6.3-inch OLED display offering 2400 x 1080 resolution, a smooth 120Hz refresh rate, HDR10+ support, and Always-On display functionality. It is powered by the new Google Tensor G4 chip, delivering superior AI performance, multitasking capabilities, and improved power efficiency. The Pixel 9 is available with 8GB of RAM and storage options of 128GB or 256GB. The dual camera system includes a 50MP main lens and a 12MP ultra-wide, supported by Google’s latest computational photography algorithms. On the front, it features a 10.5MP selfie camera with advanced portrait and night modes. The device runs Android 15, ensuring 7 years of guaranteed updates and security patches. Its 4600 mAh battery supports 30W wired fast charging, 20W wireless charging, and reverse charging. Built with an aluminum frame, Gorilla Glass protection, and IP68 resistance, it offers durability and cutting-edge software integration.",
    },
    {
      "imagepath": "assets/images/9-pro.jpg",
      "name": "Pixel 9 Pro",
      "stats": "12GB - 256GB",
      "price": "Rs 280,000",
      "category": "Google Pixel",
      "description":
          "The Google Pixel 9 Pro, released in September 2024, features a 6.8-inch LTPO OLED display with 3200 x 1440 resolution, adaptive 1-120Hz refresh rate, HDR10+, and Always-On functionality. It is powered by the Google Tensor G4 processor with advanced AI and machine learning enhancements, paired with 12GB RAM and storage options up to 1TB. The triple rear camera system includes a 50MP primary sensor, 48MP telephoto with 5x optical zoom, and 48MP ultra-wide, offering flagship-level computational photography. The 10.5MP front camera supports 4K video and Face Unlock. Running Android 15 with long-term update support, it integrates deeply with Google’s AI ecosystem. The Pixel 9 Pro houses a 5000 mAh battery with 35W wired fast charging, 23W wireless charging, and reverse wireless charging. Its premium build includes Gorilla Glass Victus, an aluminum frame, and IP68 water and dust resistance. It stands as one of the most powerful Android smartphones of 2024.",
    },
    {
      "imagepath": "assets/images/12.jpg",
      "name": "iPhone 12",
      "stats": "4GB - 128GB",
      "price": "Rs 135,000",
      "category": "iPhone",
      "description":
          "The iPhone 12, launched in October 2020, features a 6.1-inch Super Retina XDR OLED display with 2532 x 1170 resolution at 460 ppi, HDR10 support, and Ceramic Shield protection. Powered by the Apple A14 Bionic chip with 4GB RAM, it ensures smooth performance and efficiency. Storage options include 64GB, 128GB, and 256GB. The dual-camera system consists of a 12MP wide and 12MP ultra-wide lens, delivering excellent night and portrait shots powered by Deep Fusion and Smart HDR 3. The 12MP front camera supports Night Mode, 4K video, and Dolby Vision HDR. Running iOS 14 (upgradable to iOS 18), it offers a smooth and secure software experience. Its 2815 mAh battery supports 20W wired charging and 15W MagSafe wireless charging. The iPhone 12’s aerospace-grade aluminum frame and IP68 resistance make it durable, while 5G connectivity and seamless ecosystem integration make it a well-rounded device even in 2025.",
    },
    {
      "imagepath": "assets/images/13.jpg",
      "name": "iPhone 13",
      "stats": "4GB - 128GB",
      "price": "Rs 160,000",
      "category": "iPhone",
      "description":
          "The iPhone 13, released in September 2021, features a 6.1-inch Super Retina XDR OLED display with 2532 x 1170 resolution, HDR10, and Dolby Vision support, delivering vibrant visuals. It is powered by the Apple A15 Bionic chip with 4GB RAM and storage options of 128GB, 256GB, and 512GB. The dual-camera system includes a 12MP wide sensor with sensor-shift optical image stabilization and a 12MP ultra-wide, enabling excellent low-light and cinematic shots. The 12MP TrueDepth front camera supports Night Mode and 4K Dolby Vision recording. Running iOS 15 (upgradable to iOS 18), it ensures smooth software updates. The 3240 mAh battery supports 20W fast charging, 15W MagSafe wireless charging, and Qi wireless charging. With its aluminum frame, Ceramic Shield front, and IP68 rating, it is durable and stylish. 5G connectivity, long battery life, and integration with Apple’s ecosystem make the iPhone 13 a strong option in 2025.",
    },
    {
      "imagepath": "assets/images/16-pro-max.jpg",
      "name": "iPhone 16 Pro",
      "stats": "8GB - 256GB",
      "price": "Rs 390,000",
      "category": "iPhone",
      "description":
          "The iPhone 16 Pro Max, launched in September 2024, is Apple’s largest flagship featuring a 6.9-inch Super Retina XDR LTPO OLED display with 120Hz adaptive refresh, HDR10, and Dolby Vision. It is powered by the A18 Pro chip, delivering cutting-edge performance with improved efficiency and AI integration. It comes with 8GB RAM and storage options of 256GB, 512GB, and 1TB. Its advanced triple-camera system includes a 48MP wide, 48MP 5x telephoto exclusive to the Pro Max, and 12MP ultra-wide with advanced low-light performance. The 12MP front camera supports autofocus, 4K HDR video, and improved cinematic features. Running iOS 18, it integrates enhanced AI features, visual intelligence, and productivity tools. A 4500 mAh battery supports 30W wired fast charging, 15W MagSafe wireless charging, and reverse wireless charging. With a titanium frame, Ceramic Shield, and IP68 rating, the iPhone 16 Pro Max combines durability, innovation, and photography excellence.",
    },
    {
      "imagepath": "assets/images/17-air.jpg",
      "name": "iPhone 17 Air",
      "stats": "8GB - 128GB",
      "price": "Rs 340,000",
      "category": "iPhone",
      "description":
          "The iPhone 17 Air, expected in September 2025, introduces a slim and lightweight design while maintaining flagship capabilities. It features a 6.1-inch Super Retina XDR OLED display with 2556 x 1179 resolution, ProMotion up to 120Hz, HDR10, and Always-On functionality. Powered by the Apple A19 chip with 8GB RAM, it delivers performance and efficiency with AI-driven optimizations. Storage options include 128GB, 256GB, and 512GB. The dual-camera setup includes a 48MP wide sensor and 12MP ultra-wide with Smart HDR 6 and Night Mode. The 12MP front camera supports autofocus, 4K HDR, and improved portrait features. Running iOS 19, it offers the latest AI enhancements and visual intelligence. A 3700 mAh battery supports 25W wired charging, 15W MagSafe, and reverse wireless charging. Built with a slim aluminum frame, Ceramic Shield glass, and IP68 resistance, the iPhone 17 Air is designed for those seeking portability without compromising flagship performance.",
    },
    {
      "imagepath": "assets/images/17-pro.jpg",
      "name": "iPhone 17 Pro",
      "stats": "8GB - 256GB",
      "price": "Rs 420,000",
      "category": "iPhone",
      "description":
          "The iPhone 17 Pro, expected in September 2025, is Apple’s next-generation premium smartphone featuring a 6.3-inch Super Retina XDR OLED LTPO display with 2796 x 1290 resolution, 120Hz ProMotion, HDR10, and Dolby Vision. It is powered by the A19 Pro chip with 8GB RAM, enabling unmatched efficiency and AI-driven performance. Storage options include 256GB, 512GB, and 1TB. The triple-camera system includes a 48MP wide, 48MP telephoto with 6x optical zoom, and 12MP ultra-wide lens. The 12MP front camera delivers 4K HDR video, Night Mode, and enhanced portrait features. Running iOS 19, it brings next-gen AI productivity and security tools. Its 4100 mAh battery supports 30W wired charging, 15W MagSafe, and reverse wireless charging. Constructed with a titanium frame, Ceramic Shield glass, and IP68 resistance, the iPhone 17 Pro is built for premium durability, cutting-edge photography, and performance excellence for professionals and enthusiasts alike.",
    },
    {
      "imagepath": "assets/images/17-pro-max.jpg",
      "name": "iPhone 17 Pro",
      "stats": "8GB - 512GB",
      "price": "Rs 460,000",
      "category": "iPhone",
      "description":
          "The iPhone 17 Pro, expected in September 2025, is Apple’s top-tier flagship with a 6.9-inch Super Retina XDR OLED LTPO display featuring 120Hz ProMotion, HDR10, and Dolby Vision. Powered by the A19 Pro chip with 8GB RAM, it delivers industry-leading performance and advanced AI features. It is available in 256GB, 512GB, and 1TB storage options. The advanced quad-camera system includes a 48MP wide, 48MP periscope telephoto with 10x zoom, 12MP ultra-wide, and a LiDAR scanner for AR functionality. The 12MP front camera supports 4K HDR video, autofocus, and AI portrait enhancements. Running iOS 19, it offers new productivity tools, AI integration, and enhanced security. Its 4700 mAh battery supports 35W fast charging, 15W MagSafe, and reverse wireless charging. With a titanium frame, Ceramic Shield glass, and IP68 dust and water resistance, the iPhone 17 Pro  is built for professionals seeking the ultimate smartphone experience.",
    },
    {
      "imagepath": "assets/images/n-1.jpg",
      "name": "Nothing Phone",
      "stats": "8GB - 128GB",
      "price": "Rs 120,000",
      "category": "Nothing Phone",
      "description":
          "The Nothing Phone 1, launched in July 2022, features a unique transparent design with LED glyph lighting on the back. It sports a 6.55-inch OLED display with 2400 x 1080 resolution, 120Hz refresh rate, HDR10+ support, and Gorilla Glass protection. Powered by the Snapdragon 778G+ processor with 8GB RAM, it offers smooth multitasking and gaming performance. Storage options include 128GB and 256GB. The dual-camera system consists of a 50MP wide and 50MP ultra-wide sensor with advanced night and HDR modes. The 16MP front camera supports 1080p video and AI enhancements. Running Nothing OS based on Android 12 (upgradable to Android 14), it delivers a clean, minimal interface with long-term updates. A 4500 mAh battery powers the device with 33W wired charging, 15W wireless charging, and reverse wireless support. With its transparent back, aluminum frame, and IP53 splash resistance, the Nothing Phone 1 offers a refreshing, futuristic take on smartphone design.",
    },
    {
      "imagepath": "assets/images/o-11.jpg",
      "name": "OnePlus 11",
      "stats": "8GB - 128GB",
      "price": "Rs 180,000",
      "category": "OnePlus",
      "description":
          "The OnePlus 11, launched in January 2023, is a flagship killer featuring a 6.7-inch LTPO3 AMOLED display with 3216 x 1440 resolution, adaptive 1-120Hz refresh rate, HDR10+, and Dolby Vision support. It is powered by the Snapdragon 8 Gen 2 processor with 8GB or 16GB RAM and storage options up to 512GB. The triple rear camera system, co-engineered with Hasselblad, includes a 50MP wide, 48MP ultra-wide, and 32MP telephoto with 2x zoom. The 16MP front camera supports 4K video and HDR. Running OxygenOS 13 based on Android 13 (upgradable to Android 15), it delivers smooth performance and customizations. The 5000 mAh battery supports 100W wired fast charging and 50W wireless charging, ensuring minimal downtime. Built with Gorilla Glass Victus, an aluminum frame, and IP64 splash resistance, the OnePlus 11 delivers premium features at a competitive price, making it a reliable flagship option.",
    },
  ];
  late List<Map<String, String>> _filteredProducts;
  String _selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    _filteredProducts = List.from(products);
  }

  List<String> getCategories() {
    final categories = products.map((p) => p['category']!).toSet().toList();
    categories.sort();
    return ["All", ...categories];
  }

  void _filterProducts() {
    setState(() {
      _filteredProducts = products.where((product) {
        final matchesCategory =
            _selectedCategory == "All" ||
            product['category'] == _selectedCategory;
        final matchesSearch = product['name']!.toLowerCase().contains(
          _searchController.text.toLowerCase(),
        );
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  void _searchProducts(String query) {
    _filterProducts();
  }

  void _selectCategory(String category) {
    _selectedCategory = category;
    _filterProducts();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;
    final bgColor = theme.scaffoldBackgroundColor;
    final isDark = theme.brightness == Brightness.dark;

    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 3;
    if (screenWidth >= 1200) {
      crossAxisCount = 8;
    } else if (screenWidth >= 800) {
      crossAxisCount = 5;
    }

    double childAspectRatio = (screenWidth / crossAxisCount) / 280;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 15, 0, 15),
            child: Text(
              "Latest Products",
              style: TextStyle(
                fontSize: 30,
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
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: isDark ? Colors.grey[700] : Colors.grey[300]),

            // Category Filter
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: getCategories().map((category) {
                  final isSelected = _selectedCategory == category;
                  return GestureDetector(
                    onTap: () => _selectCategory(category),
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF0A4C8A)
                            : (isDark ? Colors.grey[800] : Colors.grey[200]),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : (isDark ? Colors.white : Colors.black),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                onChanged: _searchProducts,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "Search for a product...",
                  hintStyle: TextStyle(
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                  filled: true,
                  fillColor: isDark ? Colors.grey[850] : Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

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
            Divider(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
