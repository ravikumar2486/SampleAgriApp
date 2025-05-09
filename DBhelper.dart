import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  DBhelper._();
  static final DBhelper getInstance = DBhelper._();

  static const String TABLE_NOTE = "note";
  static const String COLUMN_NOTE_SNO = "sno";
  static const String COLUMN_NOTE_NAME = "name";
  static const String COLUMN_NOTE_EXPERTISE = "expertise";
  static const String COLUMN_NOTE_CONTACT = "contact";

  Database? myDB1;

  Future<Database> getDB1() async {
    myDB1 ??= await openDB1();
    return myDB1!;
  }

  Future<Database> openDB1() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "noteDB.db");

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $TABLE_NOTE (
            $COLUMN_NOTE_SNO INTEGER PRIMARY KEY AUTOINCREMENT,
            $COLUMN_NOTE_NAME TEXT NOT NULL,
            $COLUMN_NOTE_EXPERTISE TEXT NOT NULL,
            $COLUMN_NOTE_CONTACT TEXT NOT NULL
          )
        ''');
        print("✅ Database and table created successfully!");
      },
    );
  }

  // ✅ DELETE Old Database (Run this ONCE if needed)
  Future<void> deleteDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "noteDB.db");
    await deleteDatabase(dbPath);
    print("⚠️ Old Database Deleted. Restart the App.");
  }

  // ✅ INSERT Data
  Future<bool> addDetail({required String mName, required String mExpertise, required String mContact}) async {
    var db = await getDB1();
    int rowsEffected = await db.insert(TABLE_NOTE, {
      COLUMN_NOTE_NAME: mName,
      COLUMN_NOTE_EXPERTISE: mExpertise,
      COLUMN_NOTE_CONTACT: mContact,
    });
    print("✅ Rows Inserted: $rowsEffected");
    return rowsEffected > 0;
  }

  // ✅ FETCH All Notes
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB1();
    return await db.query(TABLE_NOTE);
  }

  // ✅ UPDATE Note
  Future<bool> updateNote({required int sno, required String title, required String expertise, required String contact}) async {
    var db = await getDB1();
    int rowsEffected = await db.update(
      TABLE_NOTE,
      {
        COLUMN_NOTE_NAME: title,
        COLUMN_NOTE_EXPERTISE: expertise,
        COLUMN_NOTE_CONTACT: contact,
      },
      where: "$COLUMN_NOTE_SNO = ?",
      whereArgs: [sno],
    );
    return rowsEffected > 0;
  }

  // ✅ DELETE Note
  Future<bool> deleteNote({required int sno}) async {
    var db = await getDB1();
    int rowsEffected = await db.delete(
      TABLE_NOTE,
      where: "$COLUMN_NOTE_SNO = ?",
      whereArgs: [sno],
    );
    return rowsEffected > 0;
  }
}
