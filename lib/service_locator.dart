import 'package:get_it/get_it.dart';
import 'package:ghost_story_tools_v3/models/boardTileModel.dart';

import 'models/pointsModel.dart';

GetIt locator = GetIt();

void setupLocator() {
  // Register services
  locator.registerFactory<BoardTileModel>(() => BoardTileModel());
  locator.registerFactory<PointsModel>(() => PointsModel());
  // Register models
}