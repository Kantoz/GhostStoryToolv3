import 'package:ghost_story_tools_v3/persistence/persistenceModel/Points.dart';
import 'package:hive/hive.dart';

Future<Map<dynamic,dynamic>> getAllPoints() async {
  if (!Hive.isBoxOpen('points')) 
    await Hive.openBox('points');
    Map temp = Hive.box('points').toMap();
  return temp; 
}

Future<void> savePoints(Points points) async {
  if (!Hive.isBoxOpen('points')) 
    await Hive.openBox('points');
  await Hive.box('points').add(points);
}
