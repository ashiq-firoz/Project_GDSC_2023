import 'package:hive_flutter/adapters.dart';
part 'plantmodel.g.dart';

@HiveType(typeId: 3)
class Plant {
  @HiveField(0)
  String name;

  @HiveField(1)
  String location;

  @HiveField(2)
  double coins;

  @HiveField(3)
  int varification;

  Plant(
      {required this.coins,
      required this.location,
      required this.name,
      required this.varification});
}
