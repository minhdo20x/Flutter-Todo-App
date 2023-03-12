import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'task.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory =
        await getApplicationDocumentsDirectory(); //imp dart:io to use Directory and pkg:path_provider to use getApp...()
    String path =
        join(documentsDirectory.path, 'tasks.db'); //pkg:path.dart to use join()
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY,
        name TEXT,
        isDone INTEGER
      )
    ''');
  }

  Future<List<Task>> getTasks() async {
    Database db = await instance.database;
    var tasks = await db.query('tasks', orderBy: 'name');
    List<Task> taskList =
        tasks.isNotEmpty ? tasks.map((e) => Task.fromJson(e)).toList() : [];
    return taskList;
  }

  Future<int> add(Task task) async {
    Database db = await instance.database;
    return await db.insert('tasks', task.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Task task) async {
    Database db = await instance.database;
    return await db
        .update('tasks', task.toMap(), where: 'id=?', whereArgs: [task.id]);
  }
}
