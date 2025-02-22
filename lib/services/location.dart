import 'dart:io';

enum SKLocationViewMode { directory, library }

class SKLocationModel {
  String realPath;
  String showPath = "";
  bool isRoot = false;
  bool isLeaf = false;
  SKLocationViewMode viewModel = SKLocationViewMode.directory;

  SKLocationModel(this.realPath);

  SKLocationModel.fromDirectory(Directory dir) : realPath = dir.path;

  static SKLocationModel fromPath(String path) {
    var model = SKLocationModel(path);
    model.showPath = path;
    return model;
  }
}

Future<List<SKLocationModel>> selectLocations() async {
  var foldersList = List<SKLocationModel>.empty(growable: true);
  foldersList.add(SKLocationModel("file://work"));
  foldersList.add(SKLocationModel("file://blog"));

  return foldersList;
}
