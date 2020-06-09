// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ghost_story_tools_v3/components/CustomSwitchButton.dart';
// import 'package:ghost_story_tools_v3/models/pointsModel.dart';
// import 'package:ghost_story_tools_v3/persistence/databaseHelper.dart';
// import 'package:ghost_story_tools_v3/persistence/persistenceModel/Points.dart';
// import 'package:ghost_story_tools_v3/widgets/SliderWidget.dart';
// import 'package:ghost_story_tools_v3/widgets/Sliders/DifficultySliderWidget.dart';
// import 'package:ghost_story_tools_v3/widgets/Sliders/GhostsSliderWidget.dart';
// import 'package:ghost_story_tools_v3/widgets/Sliders/IncarnationsWidget.dart';
// import 'package:ghost_story_tools_v3/widgets/Sliders/PortalPositionSliderWidget.dart';
// import 'package:ghost_story_tools_v3/widgets/Sliders/QiSliderWidget.dart';
// import 'package:ghost_story_tools_v3/widgets/Sliders/TaoistsSliderWidget.dart';
// import 'package:ghost_story_tools_v3/widgets/Sliders/VillageTilesSliderWidget.dart';
// import 'package:ghost_story_tools_v3/widgets/Sliders/VillagersSliderWidget.dart';
// import 'package:ghost_story_tools_v3/widgets/drawer.dart';
// import 'package:hive/hive.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:ghost_story_tools_v3/helper/extensions.dart';

// import '../service_locator.dart';

// class PointsWidget extends StatefulWidget {
//   static const String routeName = '/points';

//   @override
//   _PointsWidgetState createState() => _PointsWidgetState();
// }

// class _PointsWidgetState extends State<PointsWidget> {
//   final globalKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return ScopedModel<PointsModel>(
//         model: locator<PointsModel>(),
//         child: ScopedModelDescendant<PointsModel>(
//             builder: (BuildContext context, Widget child, PointsModel model) {
//           return Scaffold(
//               drawer: AppDrawer(),
//               key: globalKey,
//               appBar: AppBar(
//                 title: Text(model.title + ': ' + model.getPoints().toString()),
//                 actions: <Widget>[
//                   FlatButton(
//                     textColor: Colors.white,
//                     onPressed: () {
//                       savePoint(model);
//                     },
//                     child: Text("Save"),
//                     shape: CircleBorder(
//                         side: BorderSide(color: Colors.transparent)),
//                   ),
//                   FlatButton(
//                     textColor: Colors.white,
//                     onPressed: () {
//                       loadPoints(model, context);
//                     },
//                     child: Text("Load"),
//                     shape: CircleBorder(
//                         side: BorderSide(color: Colors.transparent)),
//                   ),
//                 ],
//               ),
//               body: Column(children: <Widget>[
//                 Container(
//                   child: CustomSwitchButton(
//                       onText: 'WON',
//                       offText: 'LOSS',
//                       value: model.won,
//                       showOnOff: true,
//                       onToggle: (value) => model.setWon(!value),
//                       width: 100),
//                   padding: EdgeInsets.only(top: 10,left: 40,right: 40),
//                 ),
//                 SliderWidget(
//                     DifficultySliderWidget(),
//                     (double value) => (value * 3).getDifficulty(),
//                     'Difficulty',
//                     15),
//                 SliderWidget(QiSliderWidget(),
//                     (double value) => (value * 20).toStringAsFixed(0), 'Qi', 0),
//                 SliderWidget(
//                     GhostsSliderWidget(),
//                     (double value) => (value * 20).toStringAsFixed(0),
//                     'Ghosts',
//                     0),
//                 SliderWidget(
//                     TaoistsSliderWidget(),
//                     (double value) => (value * 4).toStringAsFixed(0),
//                     'Taoists',
//                     0),
//                 SliderWidget(
//                     VillageTilesSliderWidget(),
//                     (double value) => (value * 3).toStringAsFixed(0),
//                     'Vailage Tiles',
//                     0),
//                 SliderWidget(
//                     IncarnationsSliderWidget(),
//                     (double value) => (value * 6).toStringAsFixed(0),
//                     'Incarnations',
//                     0),
//                 SliderWidget(
//                     VillagersSliderWidget(),
//                     (double value) => (value * 3).toStringAsFixed(0),
//                     'Villagers',
//                     0),
//                 SliderWidget(
//                     PortalPositionSliderWidget(),
//                     (double value) => (value * 2).getPortalPosition(),
//                     'Portal Position',
//                     0),
//               ]));
//         }));
//   }

//   @override
//   void dispose() {
//     Hive.box('points').close();
//     super.dispose();
//   }

//   void savePoint(PointsModel model) {
//     savePoints(new Points('1', '2', '3', '4', model.getPoints(), new DateTime.now())).then((value) => globalKey.currentState.showSnackBar(new SnackBar(content: Text('Gespeichert!'))));
//   }

//   void loadPoints(PointsModel model, BuildContext context) {
//     Hive.openBox('points');
//     Map p = Hive.box('points').toMap();
//     globalKey.currentState
//         .showSnackBar(new SnackBar(content: Text(p[0].date.toString())));
//   }
// }
