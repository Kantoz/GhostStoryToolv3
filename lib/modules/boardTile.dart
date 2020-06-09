import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghost_story_tools_v3/data/boardTileDto.dart';



  class BoardTile extends StatelessWidget {
    final BoardTileDto tile;
    
    BoardTile(this.tile);


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

  // BoardTileModel model = locator<BoardTileModel>();

  return 
  Card(
    shadowColor: Colors.grey,
    elevation: 4,
    child:
    Container(
      height: 250, 
      margin: new EdgeInsets.all(1.0), 
      child: 
        GestureDetector(
          onLongPress: () { _showDialog(tile.helpText); }, 
          child:                   
            Image.asset(
              tile.imagePath, 
              fit: BoxFit.fill,
            )
      )
    )
  );
  }
}