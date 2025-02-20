import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzaku/services/location.dart';

class SKGlobalLocationNavigator {
  Map<int, SKLocationModel> locationHistory = {};
  int currentLocationIndex = 0;

  static final SKGlobalLocationNavigator instance = SKGlobalLocationNavigator();

  SKLocationModel initialLocation(String path) {
    var newLoc = SKLocationModel.fromPath(path);
    currentLocationIndex = 0;
    locationHistory = {currentLocationIndex: newLoc};
    return newLoc;
  }

  SKLocationModel newLocation(String path) {
    var newLoc = SKLocationModel.fromPath(path);
    locationHistory[currentLocationIndex += 1] = newLoc;
    return newLoc;
  }

  SKLocationModel? back() {
    if (currentLocationIndex > 0) {
      return locationHistory[currentLocationIndex -= 1];
    }
    return locationHistory[0];
  }

  SKLocationModel? forward() {
    if (currentLocationIndex < locationHistory.length - 1) {
      return locationHistory[++currentLocationIndex];
    }
    return null;
  }

  SKLocationModel? current() {
    return locationHistory[currentLocationIndex];
  }
}

final StateProvider<SKLocationModel?> glLocationProvider =
    StateProvider((_) => null);
