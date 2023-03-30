import 'package:hive_flutter/hive_flutter.dart';
part 'bluemodel.g.dart';

@HiveType(typeId: 2)
class BlueData {
  @HiveField(0)
  double coins;

  @HiveField(1)
  int trash;

  @HiveField(2)
  String level;

  BlueData({required this.coins, required this.trash, required this.level});
}
