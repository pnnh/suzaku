import 'package:quantum/filesystem/file.dart';
import 'package:quantum/utils/random.dart';

class Folders {
  static Future<QMFileModel?> pickFolder() async {
    // String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    //
    // if (selectedDirectory != null) {
    //   logger.d("selectedDirectory: $selectedDirectory");
    //
    //   var pk = generateRandomString(16);
    //   var newFolder = QMFileModel(pk, path: selectedDirectory);
    //   await insertFolder(newFolder);
    //
    //   return newFolder;
    // }

    return null;
  }
}

Future<QMFileModel?> getFolder(String pk) async {
  var sqlText = "select * from folders where pk = ?";

  // var list = await DBHelper().selectAsync(sqlText, [pk]);
  //
  // logger.d("list ${list.length}");
  //
  // if (list.isNotEmpty) {
  //   return QMFileModel.fromJson(list[0]);
  // }

  return null;
}

Future<void> updateFilesCount(String pk, int count) async {
  // var sqlText = '''update folders set count = ? where pk = ?;''';
  //
  // await DBHelper().executeAsync(sqlText, [count, pk]);
}

Future<void> insertFolder(QMFileModel model) async {
  var sqlTextInsertFolder = '''
insert into folders(pk, path, count)
values(?, ?, 0);
''';
  var pk = generateRandomString(8);
  // var dbInstance = DBHelper.instance;
  // await dbInstance.executeAsync(sqlTextInsertFolder, [pk, model.path]);
}
