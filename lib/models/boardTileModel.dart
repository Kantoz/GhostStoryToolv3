import 'package:flutter/material.dart';
import 'package:ghost_story_tools_v3/data/boardTileDto.dart';
import 'package:ghost_story_tools_v3/data/boardTiles.dart';
import 'package:ghost_story_tools_v3/data/playerTileDto.dart';
import 'package:ghost_story_tools_v3/helper/helper.dart';
import 'package:ghost_story_tools_v3/helper/extensions.dart';
import 'package:scoped_model/scoped_model.dart';

class BoardTileModel extends Model{
  List<BoardTileDto> _boardTiles = [];
  List<BoardTileDto> get boardTiles => _boardTiles;
  void setBoardTile(List<BoardTileDto> value) {
    _boardTiles = value;
    notifyListeners();
  }

  List<PlayerTileDto> _playerTiles = [];
  List<PlayerTileDto> get playerTiles => _playerTiles;
  void setPlayerTile(List<PlayerTileDto> value) {
    _playerTiles = value;
    notifyListeners();
  }

  String _title = "Board";
  String get title => _title;
  void setTitle(String value){
    _title = value;
    notifyListeners();
  }

  BoardTileModel(){
    shuffle();
  }

  static BoardTileModel of(BuildContext context) => ScopedModel.of<BoardTileModel>(context, rebuildOnChange: true);

  void shuffle() {
    setBoardTile(allBoardTiles.where((element) => element.gsExtension == '').toList().shuffleList());
    setPlayerTile(shufflePlayerList().toList().shuffleList());
  }
}