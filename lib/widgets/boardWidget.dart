import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghost_story_tools_v3/models/boardTileModel.dart';
import 'package:ghost_story_tools_v3/modules/boardTile.dart';
import 'package:scoped_model/scoped_model.dart';

class BoardWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => 
    ScopedModelDescendant<BoardTileModel>(
      builder: (
        BuildContext context, Widget child, BoardTileModel model) => 
           ListView.builder(
            itemCount: 1,
            padding: EdgeInsets.only(top:0,bottom: 0,),
            shrinkWrap: true,
             itemBuilder: (context, index) =>   
              Card(
                elevation: 4,
                child: 
                  Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: <Widget>[
                    // Row(children: <Widget>[], )
                    Container(child: 
                    Card(child: Center(child: Text('Board',style: TextStyle(fontSize: 30),)), color: Colors.blue[200],elevation: 8,)),
                    GridView.count(
                      crossAxisCount: 3, 
                      controller: new ScrollController(keepScrollOffset: false), 
                      shrinkWrap: true, 
                      scrollDirection: Axis.vertical, 
                      children: model.boardTiles.map(
                        (tile) => 
                          BoardTile(tile)
                      ).toList()
                    )
                  ],)
                  
              )
       )
    );
}