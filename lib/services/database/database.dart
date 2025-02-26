import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteClient {
  late Database _database;

  static Future<SqliteClient> connect() async {
    var databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'venus.db');

    var touchTableSql = '''
create table if not exists main.locations
(
    uid   text primary key,
    name  text,
    show_path text,
    real_path text not null
);
''';

    Database database = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(touchTableSql);
    });

    var helper = SqliteClient();
    helper._database = database;

    return helper;
  }

  Future<dynamic> databaseInsert(String sqlText, List params) async {
    var result = await _database.rawInsert(sqlText, params);
    return result;
  }

  Future<void> executeAsync(String sql,
      [List<Object?> parameters = const []]) async {
    _database.execute(sql, parameters);
  }

  Future<List<Map<String, Object?>>> selectAsync(String sql,
      [List<Object?> parameters = const []]) async {
    return _database.rawQuery(sql, parameters);
  }

  Future<void> transactionAsync(Map<String, List<Object?>> commands) async {
    await _database.transaction((txn) async {
      for (var command in commands.entries) {
        await txn.execute(command.key, command.value);
      }
    });
  }
}
