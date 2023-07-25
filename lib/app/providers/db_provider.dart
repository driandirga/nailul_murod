import 'dart:io';
import 'package:nailul_murod/app/modules/bookmark/bookmark_model.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider db = DBProvider._();
  static Database? _database;

  DBProvider._();

  final String _databaseName = 'nailul_murod.db';
  final int _databaseVersion = 1;

  //tb_bookmark
  final String table = 'tb_bookmark';
  final String id = 'id';
  final String title = 'title';
  final String detail = 'detail';

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database!;

    // If database don't exists, create one
    _database = await _initDatabase();

    return _database!;
  }

  Future _initDatabase() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = p.join(docDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  //CREATE TABLE
  Future _onCreate(Database db, int version) async {
    final dynamic cSqlBookmark =
        'CREATE TABLE $table ($id INTEGER PRIMARY KEY, $title TEXT NOT NULL, $detail TEXT NOT NULL)';

    await db.execute(cSqlBookmark);
  }

  //CREATE/INSERT
  Future<int> createBookmark(Map<String, dynamic> row) async {
    final res = await _database!.insert(table, row);
    return res;
  }

  //READ
  Future<List<Bookmark>> getAllBookmark() async {
    final dynamic sql = 'SELECT * FROM $table';
    final data = await _database!.rawQuery(sql);

    List<Bookmark> list =
        data.isNotEmpty ? data.map((c) => Bookmark.fromJson(c)).toList() : [];
    return list;
  }

  //DELETE
  Future<int> deleteBookmark() async {
    final dynamic sql = 'DELETE FROM $table';
    final query = await _database!.rawDelete(sql);
    return query;
  }

  Future<int> deleteDtlBookmark(String newId, String newTitle) async {
    final dynamic sql =
        "DELETE FROM $table WHERE $id=$newId AND $title='$newTitle'";
    final query = await _database!.rawDelete(sql);
    return query;
  }

  Future<void> deleteDatabase() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = p.join(docDirectory.path, _databaseName);
    databaseFactory.deleteDatabase(path);
  }
}
