import 'dart:math';

import 'package:ghost_story_tools_v3/data/pointsEnums.dart';
import 'package:ghost_story_tools_v3/models/pointsModel.dart';

extension ListExtension<T> on List<T>{
  List<T> shuffleList(){
    Random r = new Random();
    List<T> shuffledList = new List<T>();
    int anzahl = this.length;
    for (var i = 0; i < anzahl; i++) {
      int index = r.nextInt(this.length);
      shuffledList.add(this[index]);
      this.removeAt(index);
    }
    return shuffledList;
  }
}

extension PointsCalculate on PointsModel{
  int getPoints(){
		int points = 0;
		if(this.won){
			points += this.difficulty == Difficulty.hell.index + 1 ? 20 : 10;
			points += this.ghosts.toInt();
		}
		else{
			points -= this.ghosts.toInt();
		}
		points += this.qi.toInt();
		points -= this.taoists.toInt() * 3;
		points -= this.villageTiles.toInt() * 4;
    points += this.incarnations.toInt() * 2;
		points += this.villagers.toInt();
		points += this.portalPosition == 1 ? 4 : this.portalPosition == 2 ? 2 : 0;
    return points;
  }
}

extension DoubleToDifficulty on double{
  String getDifficulty(){
     switch (Difficulty.values[this.toInt()]) {
       case Difficulty.normal:
         return 'Normal';
         break;
       case Difficulty.hard:
         return 'Hard';
         break;
       case Difficulty.harder:
         return 'Harder';
         break;
       case Difficulty.hell:
         return 'Hell';
         break;
       default:
        throw new Exception();
     }
  }

  String getPortalPosition(){
     switch (PortalPosition.values[this.toInt()]) {
       case PortalPosition.center:
         return 'Center';
         break;
       case PortalPosition.edge:
         return 'Edge';
         break;
       case PortalPosition.corner:
         return 'Corner';
         break;
       default:
        throw new Exception();
     }
     
  }
}