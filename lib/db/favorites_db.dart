import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/favorite_product.dart';

class FavoritesDB {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'favorites.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            price TEXT,
            stats TEXT,
            image TEXT,
            color TEXT,
            warranty TEXT,
            description TEXT
          )
        ''');
      },
    );
  }

  static Future<void> addFavorite(FavoriteProduct product) async {
    final db = await database;
    await db.insert(
      'favorites',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<FavoriteProduct>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');
    return maps.map((e) => FavoriteProduct.fromMap(e)).toList();
  }

  static Future<void> removeFavorite(int id) async {
    final db = await database;
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }
}
