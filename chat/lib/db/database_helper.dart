import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'users.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT)",
        );
      },
    );
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    await db.insert('users', user, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Map?> getUser(String username) async {
    final db = await database;
    List<Map> result = await db.query('users', where: 'username = ?', whereArgs: [username]);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }
}
