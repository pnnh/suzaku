import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quantum/quantum.dart';
import 'package:suzaku/services/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'state.g.dart';

class SKGlobalLocationNavigator {
  Map<int, SKLocationModel> locationHistory = {};
  int currentLocationIndex = 0;
  String initPath = "";
  String realPath = "";

  static final SKGlobalLocationNavigator instance = SKGlobalLocationNavigator();

  SKLocationModel initialLocation(String path) {
    initPath = path;
    var resolvedPath = Quantum.resolvePath(path);
    if (resolvedPath == null) {
      throw Exception("目录解析异常");
    }
    realPath = resolvedPath;
    var newLoc = SKLocationModel.fromPath(path);
    currentLocationIndex = 0;
    newLoc.isRoot = true;
    newLoc.isLeaf = true;
    locationHistory = {currentLocationIndex: newLoc};
    return newLoc;
  }

  SKLocationModel newLocation(String path) {
    var newLoc = SKLocationModel.fromPath(path);
    newLoc.isLeaf = true;
    var showPath = path.replaceFirst(realPath, initPath);
    if (Platform.isWindows) {
      showPath = showPath.replaceAll("\\", "/");
    }
    newLoc.showPath = showPath;
    var locItemCount = locationHistory.length;
    for (var i = currentLocationIndex + 1; i < locItemCount; i++) {
      locationHistory.remove(i);
    }
    locationHistory[currentLocationIndex += 1] = newLoc;
    for (var i = 0; i < locationHistory.length; i++) {
      var currentLoc = locationHistory[i];
      currentLoc?.isRoot = i == 0;
      currentLoc?.isLeaf = i == locationHistory.length - 1;
    }
    return newLoc;
  }

  SKLocationModel? back() {
    if (currentLocationIndex > 0) {
      return locationHistory[currentLocationIndex -= 1];
    }
    var nowLoc = locationHistory[0];
    return nowLoc;
  }

  SKLocationModel? forward() {
    if (currentLocationIndex < locationHistory.length - 1) {
      return locationHistory[++currentLocationIndex];
    }
    return locationHistory[currentLocationIndex];
  }

  SKLocationModel? upward() {
    var currentLoc = locationHistory[currentLocationIndex];
    if (currentLoc != null) {
      if (currentLoc.isRoot) {
        return currentLoc;
      }
      var path = currentLoc.realPath;
      var parentPath = FileSystemEntity.parentOf(path);
      if (parentPath == realPath) {
        return locationHistory[0];
      }
      return newLocation(parentPath);
    }
    return null;
  }

  SKLocationModel? current() {
    return locationHistory[currentLocationIndex];
  }
}

// 当前选中的位置
final StateProvider<SKLocationModel?> glLocationProvider =
    StateProvider((_) => null);

final StateProvider<String> listOrGridProvider = StateProvider((_) => "list");

class FilesPageModel {
  String text;
  List<SKLocationModel> locationList;

  FilesPageModel({required this.text, required this.locationList});

  FilesPageModel.empty()
      : text = "",
        locationList = [];
}

@riverpod
class FilesPageState extends _$FilesPageState {
  @override
  Future<FilesPageModel> build() async {
    var locations = await SKLocationModel.selectLocations();
    return FilesPageModel(text: '暂无内容', locationList: locations);
  }

  Future<void> reloadLocations(String loc) async {
    debugPrint("reloadLocations: $loc");

    try {
      var locationList = await SKLocationModel.selectLocations();

      var model = FilesPageModel(text: "text", locationList: locationList);
      state = AsyncData(model);
      return;
    } catch (ex) {
      var errMsg = "FilesPageState selectLocations：${ex.toString()}";
      debugPrint(errMsg);
      state = AsyncData(FilesPageModel.empty());
    }
  }
}
