import 'package:flutter/material.dart';
import 'package:ghost_story_tools_v3/models/pointsModel.dart';


class PlayerInputWidget extends StatefulWidget {
  final String _playerOneText;
  final String _playerTwoText;
  final String _playerThreeText;
  final String _playerFourText;
  PointsModel _model;
  PlayerInputWidget(PointsModel model,
      {String playerOneText,
      String playerTwoText,
      String playerThreeText,
      String playerFourText})
      : this._playerOneText = playerOneText,
        this._playerTwoText = playerTwoText,
        this._playerThreeText = playerThreeText,
        this._playerFourText = playerFourText,
        this._model = model;

  @override
  State<PlayerInputWidget> createState() => new PlayerInputState(
      _playerOneText, _playerTwoText, _playerThreeText, _playerFourText, _model);
}

class PlayerInputState extends State<PlayerInputWidget> {
  String _playerOneText;
  String _playerTwoText;
  String _playerThreeText;
  String _playerFourText;
  PointsModel _model;

  PlayerInputState(this._playerOneText, this._playerTwoText,
      this._playerThreeText, this._playerFourText, this._model);
  // TextEditingController _controllerPlayerOne = new TextEditingController();
  // TextEditingController _controllerPlayerTwo = new TextEditingController();
  // TextEditingController _controllerPlayerThree = new TextEditingController();
  // TextEditingController _controllerPlayerFour = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // PointsModel model = locator<PointsModel>();

    // return Container(child: ScopedModelDescendant<PointsModel>(
    //     builder: (BuildContext context, Widget child, PointsModel model) {
    return Dialog(
        child:
            // ScopedModelDescendant<PointsModel>(
            //     builder: (BuildContext context, Widget child, PointsModel model) {
            Container(
                height: 360,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.blueAccent,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Players',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 320,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration:
                                InputDecoration(labelText: 'Player One'),
                            onChanged: (value) => _playerOneText = value,
                          ),
                          TextField(
                            decoration:
                                InputDecoration(labelText: 'Player Two'),
                            onChanged: (value) => _playerTwoText = value,
                          ),
                          TextField(
                            decoration:
                                InputDecoration(labelText: 'Player Three'),
                            onChanged: (value) => _playerThreeText = value,
                          ),
                          TextField(
                            decoration:
                                InputDecoration(labelText: 'Player Four'),
                            onChanged: (value) => _playerFourText = value,
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  RaisedButton(
                                    color: Colors.blueAccent,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      _model.setPlayerOne(_playerOneText);
                                      _model.setPlayerTwo(_playerTwoText);
                                      _model.setPlayerThree(_playerThreeText);
                                      _model.setPlayerFour(_playerFourText);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Save'),
                                  ),
                                  RaisedButton(
                                    color: Colors.blueAccent,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                )));
  }
  // }));
}
