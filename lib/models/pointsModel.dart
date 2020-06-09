import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class PointsModel extends Model{
  double _difficulty = 1;
  double get difficulty => _difficulty;
  void setDifficulty(double value){
    _difficulty = value;
    notifyListeners();
  }

  String _title = "Points";
  String get title => _title;
  void setTitle(String value){
    _title = value;
    notifyListeners();
  }

  double _qi = 0;
  double get qi => _qi;
  void setQi(double value){
    _qi = value;
    notifyListeners();
  }

  double _ghosts = 0;
  double get ghosts => _ghosts;
  void setGhosts(double value){
    _ghosts = value;
    notifyListeners();
  }

  double _taoists = 0;
  double get taoists => _taoists;
  void setTaoists(double value){
    _taoists = value;
    notifyListeners();
  }

  double _villageTiles = 0;
  double get villageTiles => _villageTiles;
  void setVillageTiles(double value){
    _villageTiles = value;
    notifyListeners();
  }

  double _incarnations = 0;
  double get incarnations => _incarnations;
  void setIncarnations(double value){
    _incarnations = value;
    notifyListeners();
  }

  double _villagers = 0;
  double get villagers => _villagers;
  void setVillagers(double value){
    _villagers = value;
    notifyListeners();
  }

  double _portalPosition = 0;
  double get portalPosition => _portalPosition;
  void setPortalPosition(double value){
    _portalPosition = value;
    notifyListeners();
  }

  bool _won = true;
  bool get won => _won;
  void setWon(bool value){
    _won = value;
    notifyListeners();
  }

  String _playerOne = '';
  String get playerOne => _playerOne;
  void setPlayerOne(String value){
    _playerOne = value;
    notifyListeners();
  }

  String _playerTwo = '';
  String get playerTwo => _playerTwo;
  void setPlayerTwo(String value){
    _playerTwo = value;
    notifyListeners();
  }

  String _playerThree = '';
  String get playerThree => _playerThree;
  void setPlayerThree(String value){
    _playerThree = value;
    notifyListeners();
  }

  String _playerFour = '';
  String get playerFour => _playerFour;
  void setPlayerFour(String value){
    _playerFour = value;
    notifyListeners();
  }

 static PointsModel of(BuildContext context) => ScopedModel.of<PointsModel>(context, rebuildOnChange: true);
}