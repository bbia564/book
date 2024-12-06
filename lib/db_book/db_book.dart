import 'dart:convert';
import 'package:book_cover/db_book/book_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBBook extends GetxService {
  late Database dbBase;

  Future<DBBook> init() async {
    await createBookDB();
    return this;
  }

  createBookDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'book.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createBookTable(db);
          await createNoteTable(db);
        });
  }

  createBookTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS book (id INTEGER PRIMARY KEY, createdTime TEXT, name TEXT, list TEXT)');
  }

  createNoteTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS note (id INTEGER PRIMARY KEY, createdTime TEXT, title TEXT, content TEXT)');
  }

  insertBook(BookEntity entity) async {
    final id = await dbBase.insert('book', {
      'createdTime': entity.createdTime.toIso8601String(),
      'name': entity.name,
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
    });
    return id;
  }

  updateBook(BookEntity entity) async {
    await dbBase.update('book', {
      'createdTime': entity.createdTime.toIso8601String(),
      'name': entity.name,
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  deleteBook(int id) async {
    await dbBase.delete('book', where: 'id = ?', whereArgs: [id]);
  }

  cleanAllData() async {
    await dbBase.delete('book');
    await dbBase.delete('note');
  }

  insertNote(NoteEntity entity) async {
    final id = await dbBase.insert('note', {
      'createdTime': entity.createdTime.toIso8601String(),
      'title': entity.title,
      'content': entity.content,
    });
    return id;
  }

  updateNote(NoteEntity entity) async {
    await dbBase.update('note', {
      'createdTime': entity.createdTime.toIso8601String(),
      'title': entity.title,
      'content': entity.content,
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  deleteNote(int id) async {
    await dbBase.delete('note', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<BookEntity>> getBookAllData() async {
    var result = await dbBase.query('book', orderBy: 'createdTime DESC');
    return result.map((e) => BookEntity.fromJson(e)).toList();
  }

  Future<List<NoteEntity>> getNoteAllData() async {
    var result = await dbBase.query('note', orderBy: 'createdTime DESC');
    return result.map((e) => NoteEntity.fromJson(e)).toList();
  }
}
