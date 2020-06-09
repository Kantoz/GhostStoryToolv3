import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghost_story_tools_v3/models/boardTileModel.dart';
import 'package:ghost_story_tools_v3/widgets/boardWidget.dart';
import 'package:ghost_story_tools_v3/widgets/drawer.dart';
import 'package:ghost_story_tools_v3/widgets/playerWidget.dart';
import 'package:scoped_model/scoped_model.dart';

import '../service_locator.dart';

class Board extends StatelessWidget {

  static const String routeName = '/board';  

  @override
  Widget build(BuildContext context) {
    return 
      ScopedModel<BoardTileModel>(
      model: locator<BoardTileModel>(),
      child: 
        ScopedModelDescendant<BoardTileModel>(builder: (BuildContext context, Widget child, BoardTileModel model) {      
        return Scaffold(
        drawer: AppDrawer(),
          appBar: AppBar(
            title: Text(model.title),
            actions: <Widget>[
              FlatButton(
                  textColor: Colors.white,
                  onPressed: () { model.shuffle(); },
                  child: Text("Shuffle"),
                  shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                ),
            ],
          ),
          
          body:
          ListView.builder(
            itemCount: 1,
            padding: EdgeInsets.only(left: 20, right: 20),
            shrinkWrap: true,
             itemBuilder: (context, index) => 
            Column(children: 
              [BoardWidget(), PlayerWidget()]
            ))
        );
      }
    ));
  }
}