import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dbregister {
  Dbregister._();
  static final Dbregister getInstance = Dbregister._();

  static const String TABLE_LOGIN = "login";
  static const String COLUMN_LOGIN_SNO = "S_no";
  static const String COLUMN_LOGIN_NAME = "name";
  static const String COLUMN_LOGIN_EMAIL = "email";
  static const String COLUMN_LOGIN_PASSWORD = "password"; // Storing price as TEXT
// Storing price as TEXT

  Database? myDB0;

  Future<Database> getDB0() async {
    myDB0 ??= await openDB();
    return myDB0!;
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "noteDB.db");

    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE $TABLE_LOGIN (
          $COLUMN_LOGIN_SNO INTEGER PRIMARY KEY AUTOINCREMENT,
          $COLUMN_LOGIN_NAME TEXT NOT NULL,
          $COLUMN_LOGIN_EMAIL TEXT NOT NULL,
          $COLUMN_LOGIN_PASSWORD TEXT NOT NULL
          
        )
      ''');
    });
  }

  // ✅ INSERT Data (Store Price as String)
  Future<bool> addNote({required String mName, required String mEmail,required String mPassword}) async {
    var db = await getDB0();
    int rowsEffected = await db.insert(TABLE_LOGIN, {
      COLUMN_LOGIN_NAME: mName,
      COLUMN_LOGIN_EMAIL:mEmail,
      COLUMN_LOGIN_PASSWORD:mPassword,
      // COLUMN_NOTE_DESC: mDesc, // Keep as String
    });
    return rowsEffected > 0;
  }

  // ✅ FETCH All Notes
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB0();
    return await db.query(TABLE_LOGIN);
  }

  // ✅ UPDATE Note (Keep Price as String)
  Future<bool> updateNote({required int sno, required String Name, required String email,required String password}) async {
    var db = await getDB0();
    int rowsEffected = await db.update(
      TABLE_LOGIN,
      {
        COLUMN_LOGIN_NAME: Name,
        COLUMN_LOGIN_EMAIL:email,
        COLUMN_LOGIN_PASSWORD:password,// Keep as String
      },
      where: "$COLUMN_LOGIN_SNO = ?",
      whereArgs: [sno], // Correctly passing int
    );
    return rowsEffected > 0;
  }

  // ✅ DELETE Note (Fix `whereArgs`)
  Future<bool> deleteNote({required int sno}) async {
    var db = await getDB0();
    int rowsEffected = await db.delete(
      TABLE_LOGIN,
      where: "$COLUMN_LOGIN_SNO = ?",
      whereArgs: [sno], // Fixed: No quotes around sno
    );
    return rowsEffected > 0;
  }
}
