import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBconnect {
  DBconnect._();
  static final DBconnect getInstance = DBconnect._();

  static const String TABLE_NOTE = "note";
  static const String COLUMN_NOTE_SNO = "S_no";
  static const String COLUMN_NOTE_TITLE = "Crop";
  static const String COLUMN_NOTE_DESC = "Price"; // Storing price as TEXT

  Database? myDB;

  Future<Database> getDB() async {
    myDB ??= await openDB();
    return myDB!;
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "noteDB.db");

    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE $TABLE_NOTE (
          $COLUMN_NOTE_SNO INTEGER PRIMARY KEY AUTOINCREMENT,
          $COLUMN_NOTE_TITLE TEXT NOT NULL,
          $COLUMN_NOTE_DESC TEXT NOT NULL
        )
      ''');
    });
  }

  // ✅ INSERT Data (Store Price as String)
  Future<bool> addNote({required String mTitle, required String mDesc}) async {
    var db = await getDB();
    int rowsEffected = await db.insert(TABLE_NOTE, {
      COLUMN_NOTE_TITLE: mTitle,
      COLUMN_NOTE_DESC: mDesc,
      // COLUMN_NOTE_DESC: mDesc, // Keep as String
    });
    return rowsEffected > 0;
  }

  // ✅ FETCH All Notes
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB();
    return await db.query(TABLE_NOTE);
  }

  // ✅ UPDATE Note (Keep Price as String)
  Future<bool> updateNote({required int sno, required String title, required String desc}) async {
    var db = await getDB();
    int rowsEffected = await db.update(
      TABLE_NOTE,
      {
        COLUMN_NOTE_TITLE: title,
        COLUMN_NOTE_DESC: desc, // Keep as String
      },
      where: "$COLUMN_NOTE_SNO = ?",
      whereArgs: [sno], // Correctly passing int
    );
    return rowsEffected > 0;
  }

  // ✅ DELETE Note (Fix `whereArgs`)
  Future<bool> deleteNote({required int sno}) async {
    var db = await getDB();
    int rowsEffected = await db.delete(
      TABLE_NOTE,
      where: "$COLUMN_NOTE_SNO = ?",
      whereArgs: [sno], // Fixed: No quotes around sno
    );
    return rowsEffected > 0;
  }
}
