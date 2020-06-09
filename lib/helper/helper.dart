import 'dart:math';

import 'package:ghost_story_tools_v3/data/playerTileDto.dart';
import 'package:ghost_story_tools_v3/data/playerTiles.dart';

PlayerTileDto getByColor(PlayerColor color){ 
  Random r = new Random();
  return allPlayerTiles.where((element) => element.color == color).toList()[r.nextInt(2)];
}

List<PlayerTileDto> shufflePlayerList(){ 
  List<PlayerTileDto> returnList = new List<PlayerTileDto>(); 
  for (var color in PlayerColor.values) {
    returnList.add(getByColor(color));
  }
  return returnList;
}

  