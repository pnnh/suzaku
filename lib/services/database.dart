import 'package:quantum/database/database.dart';

Future<QMSqliteClient> connectMainDatabase() async {
  var initSql = '''
create table if not exists main.locations
(
    uid   text primary key,
    name  text,
    show_path text,
    real_path text not null
);
''';
  var mainDb = await QMSqliteClient.connect("suzaku/main.db", initSql: initSql);
  if (mainDb == null) {
    throw Exception("数据库连接失败");
  }
  return mainDb;
}
