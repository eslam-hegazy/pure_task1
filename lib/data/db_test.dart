import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "eslam.db");
    Database mydb = await openDatabase(path, onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Test (id AUTOINCREMENT NOT NULL INTEGER PRIMARY KEY, title TEXT, pic STRING)');
  }
}
