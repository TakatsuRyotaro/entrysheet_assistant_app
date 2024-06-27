import 'package:entrysheet_assistant_app/backEnd/models/companyinfo_model.dart';import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CompanyInfoDBHandler {
  Database? _database;
  String databaseName = "company_name";

  // Getter for the database
  Future<Database> get database async {
    if (_database == null) {
      await initDataBase();
    }
    return _database!;
  }

  // Initialize the database
  Future<void> initDataBase() async {
    String path = join(await getDatabasesPath(), '$databaseName.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) {
        // Creating the table
        return db.execute(
          'CREATE TABLE IF NOT EXISTS $databaseName(id INTEGER PRIMARY KEY AUTOINCREMENT, companyName TEXT, state TEXT)',
        );
      },
    );
  }

  // Fetching all records
  Future<List<Map<String, dynamic>>> getData() async {
    final db = await database;
    List<Map<String, dynamic>> records = await db.query(databaseName);
    return records;
  }

  // Adding new data
  Future<void> addData(CompanyInfo model) async {
    final db = await database;
    await db.insert(
      databaseName,
      {"companyName": model.companyName, "state": model.state},
    );
  }

  // Updating existing data
  Future<void> updateData(CompanyInfo model) async {
    final db = await database;
    await db.update(
      databaseName,
      {"companyName": model.companyName, "state": model.state},
      where: "id = ?",
      whereArgs: [model.id],
    );
  }

  // Deleting data
  Future<void> deleteData(CompanyInfo model) async {
    final db = await database;
    await db.delete(
      databaseName,
      where: "id = ?",
      whereArgs: [model.id],
    );
  }
}
