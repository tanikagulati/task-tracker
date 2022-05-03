import 'package:sqflite/sqflite.dart';
import 'package:todo/models/taskdata.dart';

class DB {
  static Database? db;
  static final int version = 1;
  static final String tablename = "mytasks";

  static Future<void> initdb() async {
    if (db != null) {
      return;
    }
    try {
      String path = await getDatabasesPath() + 'mytasks.db';
      db = await openDatabase(
        path,
        version: version,
        onCreate: (db, version) {
          print('Created');
          return db.execute(
              'CREATE TABLE $tablename (id INTEGER PRIMARY KEY AUTOINCREMENT,iscompleted INTEGER, title STRING, note STRING, date STRING, startTime STRING, endTime STRING, remind INTEGER, repeat STRING)');
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int?> insert(taskData? task) async {
    return await db?.insert(tablename, task!.tojson());
  }
}
