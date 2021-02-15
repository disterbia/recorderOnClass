import 'package:aa_test/model/recordFile.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RecordFileDb {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(join(await getDatabasesPath(), 'file_database.db'),
        onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE files(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT ,path TEXT,date TEXT,value INTEGER NOT NULL)");
        }, version: 1);
    return _db;
  }

  Future<void> insertFile(RecordFile file) async {
    final Database db = await database;
    await db.insert('files', file.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List<RecordFile>> getAllFiles(int value) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('files',where: "value =?",orderBy: "id DESC",
      whereArgs: [value],);
    return List.generate(maps.length, (i) {
      return RecordFile(
          id: maps[i]['id'],
          title: maps[i]['title'],
          date: maps[i]['date'],
          path: maps[i]['path'],
          value: maps[i]['value'],
      );
    });
  }

  Future<void> deleteFile(RecordFile file) async {
    final db = await database;
    await db
        .delete('files', where: "id= ?", whereArgs: [file.id],);
  }
}