import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghost_story_tools_v3/data/playerTileDto.dart';

  class PlayerTile extends StatelessWidget {
    final PlayerTileDto tile;
    final int playerNumber;
    
    PlayerTile(this.tile, this.playerNumber);


  @override
  Widget build(BuildContext context) {

    void _showDialog(String text) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Info"),
          content: new Text(text),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

    return 
    Card(elevation: 4, child: Container(height: 100, 
              width: 100,
              margin: new EdgeInsets.all(1.0), 
              child: GestureDetector(onLongPress: () {
                _showDialog(this.playerNumber.toString());
              }, child: 
                Column(children: <Widget>[
                  Text('Player '+playerNumber.toString()),
                  Image.asset(tile.imagePath,
                    fit: BoxFit.fitWidth,
                  ),
                  
                ],)
              )));
    
  }
}