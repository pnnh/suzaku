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
  return QMSqliteClient.connect("main.db", initSql: initSql);
}
