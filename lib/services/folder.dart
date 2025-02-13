import 'package:file_picker/file_picker.dart';
import 'package:suzaku/models/file.dart';

import 'package:suzaku/utils/logger.dart';

import '../utils/random.dart';
import 'database.dart';

class Folders {
  static Future<SKFileModel?> pickFolder() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory != null) {
      logger.d("selectedDirectory: $selectedDirectory");

      var pk = generateRandomString(16);
      var newFolder = SKFileModel(pk, path: selectedDirectory);
      await insertFolder(newFolder);

      return newFolder;
    }

    return null;
  }
}

Future<SKFileModel?> getFolder(String pk) async {
  var sqlText = "select * from folders where pk = ?";

  var list = await DBHelper().selectAsync(sqlText, [pk]);

  logger.d("list ${list.length}");

  if (list.isNotEmpty) {
    return SKFileModel.fromJson(list[0]);
  }

  return null;
}

Future<void> updateFilesCount(String pk, int count) async {
  var sqlText = '''update folders set count = ? where pk = ?;''';

  await DBHelper().executeAsync(sqlText, [count, pk]);
}

Future<void> insertFolder(SKFileModel model) async {
  var sqlTextInsertFolder = '''
insert into folders(pk, path, count)
values(?, ?, 0);
''';
  var pk = generateRandomString(8);
  var dbInstance = DBHelper.instance;
  await dbInstance.executeAsync(sqlTextInsertFolder, [pk, model.path]);
}

Future<List<SKFileModel>> queryLocations() async {
  // var sqlText = '''select * from folders;''';
  //
  // var list = await DBHelper().selectAsync(sqlText);
  //
  // logger.d("list ${list.length}");
  //
  // var foldersList = List.generate(list.length, (i) {
  //   return FolderModel.fromJson(list[i]);
  // });
  var foldersList = List<SKFileModel>.empty(growable: true);
  foldersList.add(SKFileModel("xxxx", path: "file://work", name: "工作目录"));

  return foldersList;
}
