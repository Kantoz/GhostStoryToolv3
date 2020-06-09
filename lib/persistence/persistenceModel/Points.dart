import 'package:hive/hive.dart';

part 'Points.g.dart';

@HiveType(typeId: 0)
class Points{
  static String objectName = 'points';
  // final int id;
  @HiveField(0)
  final String firstPlayer;
  @HiveField(1)
  final String secondPlayer;
  @HiveField(2)
  final String thirdPlayer;
  @HiveField(3)
  final String fourthPlayer;
  @HiveField(4)
  final int points;
  @HiveField(5)
  final DateTime date;

  Points(this.firstPlayer, this.secondPlayer, this.thirdPlayer, this.fourthPlayer, this.points, this.date);
}