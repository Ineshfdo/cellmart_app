import 'package:flutter/material.dart';
import '../db/favorites_db.dart';
import '../models/favorite_product.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<FavoriteProduct> favorites = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final data = await FavoritesDB.getFavorites();
    setState(() => favorites = data);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: 20,
                color: textColor?.withOpacity(0.7),
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: const Text(
                "The Favorites",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Colors.green,
                  fontFamily: "Nano",
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),

      /// BODY
      body: favorites.isEmpty
          ? Center(
              child: Text(
                "No favorites added",
                style: TextStyle(
                  color: textColor?.withOpacity(0.6),
                  fontSize: 16,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final p = favorites[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      if (!isDark)
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// IMAGE (✅ ClipRRect applied)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: 100,
                          height: 100,
                          color: isDark
                              ? const Color(0xFF2A2A2A)
                              : Colors.grey[200],
                          child: Image.asset(
                            p.image.startsWith('Images/')
                                ? p.image
                                : 'Images/${p.image}',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.image,
                                  size: 60,
                                  color: Colors.grey,
                                ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      /// DETAILS
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              p.stats,
                              style: TextStyle(
                                fontSize: 13,
                                color: textColor?.withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              p.price,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Color: ${p.color}",
                              style: TextStyle(
                                fontSize: 13,
                                color: textColor?.withOpacity(0.7),
                              ),
                            ),
                            Text(
                              "Warranty: ${p.warranty}",
                              style: TextStyle(
                                fontSize: 13,
                                color: textColor?.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// DELETE
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          await FavoritesDB.removeFavorite(p.id!);
                          loadFavorites();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
