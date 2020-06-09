import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghost_story_tools_v3/data/playerTileDto.dart';
import 'package:ghost_story_tools_v3/models/boardTileModel.dart';
import 'package:ghost_story_tools_v3/modules/playerTile.dart';
import 'package:scoped_model/scoped_model.dart';

class PlayerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScopedModelDescendant<BoardTileModel>(
      builder: (BuildContext context, Widget child, BoardTileModel model) =>
          Card(
              elevation: 4,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        child: Card(
                      child: Center(
                          child: Text(
                        'Players',
                        style: TextStyle(fontSize: 30),
                      )),
                      color: Colors.blue[200],
                      elevation: 8,
                    )),
                    Container(
                        padding: EdgeInsets.all(0),
                        child: Column(
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: getPlayerTiles(
                                    model.playerTiles.sublist(0, 2), 0)),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: getPlayerTiles(
                                    model.playerTiles.sublist(2), 2))
                          ],
                        ))
                  ]))); 

  List<PlayerTile> getPlayerTiles(List<PlayerTileDto> playerDtos, int offset) {
    List<PlayerTile> playertiles = new List<PlayerTile>();
    for (var i = 0; i < playerDtos.length; i++) {
      playertiles.add(PlayerTile(playerDtos[i], i + 1 + offset));
    }
    return playertiles;
  }
}
