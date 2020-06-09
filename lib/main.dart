// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:ghost_story_tools_v3/pages/board.dart';
import 'package:ghost_story_tools_v3/pages/highscorePage.dart';
import 'package:ghost_story_tools_v3/pages/pointsTableWidget.dart';
import 'package:ghost_story_tools_v3/persistence/persistenceModel/Points.dart';
import 'package:ghost_story_tools_v3/routes/routes.dart';
import 'package:ghost_story_tools_v3/service_locator.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as path_provider;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);  
  Hive.registerAdapter(PointsAdapter());
  // await Hive.openBox('points');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Ghost Story Tools v3';

  Widget build(BuildContext context) {
    return 
    MaterialApp(
      title: 'Welcome to GST v4',
      //home: GhostStoryMain(title: appTitle),
      home: Board(),
      routes:  {
        Routes.boards: (context) => Board(),
        Routes.points: (context) => 
          FutureBuilder(
            future: Hive.openBox('points'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasError)
                  return Text('Error while loading database: '+ snapshot.error.toString());
                else
                  return 
                  PointsWidget();
                  }
              else
                return Column();
                
            },
          ),
          Routes.highscore: (context) => HighscorePage(),
      },
    );
  }
}