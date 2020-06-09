import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghost_story_tools_v3/models/pointsModel.dart';
import 'package:ghost_story_tools_v3/persistence/databaseHelper.dart';
// import 'package:ghost_story_tools_v3/persistence/persistenceModel/Points.dart';
import 'package:ghost_story_tools_v3/widgets/drawer.dart';
import 'package:hive/hive.dart';
import 'package:scoped_model/scoped_model.dart';

import '../service_locator.dart';

class HighscorePage extends StatefulWidget {
  static const String routeName = '/highscore';

  @override
  _HighscorePageState createState() => _HighscorePageState();
}

class _HighscorePageState extends State<HighscorePage> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<PointsModel>(
        model: locator<PointsModel>(),
        child: ScopedModelDescendant<PointsModel>(
            builder: (BuildContext context, Widget child, PointsModel model) {
          return Scaffold(
              drawer: AppDrawer(),
              key: globalKey,
              appBar: AppBar(
                title: Text(model.title),
              ),
              body: ListView.builder(
                itemCount: 1,
                padding: EdgeInsets.only(left: 20, right: 20),
                shrinkWrap: true,
                itemBuilder: (context, index) => FutureBuilder(
                  future: getHighscoreWidgets(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError)
                        return Text('Error while loading database: ' +
                            snapshot.error.toString());
                      else
                        return Column(children: snapshot.data);
                    } else
                      return Column();
                  },
                ),
              ));
        }));
  }

  @override
  void dispose() {
    Hive.box('points').close();
    super.dispose();
  }

  Future<List<Widget>> getHighscoreWidgets() async {
    Map pointsMap = await getAllPoints();
    List<Text> textList = new List<Text>();
    if (pointsMap.isNotEmpty) {
      for (var i = 0; i < pointsMap.length; i++) {
        textList.add(Text(pointsMap[i].points.toString()));
      }
    }
    return textList;
  }
}
