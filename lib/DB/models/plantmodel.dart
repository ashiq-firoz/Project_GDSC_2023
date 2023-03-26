import 'package:hive_flutter/adapters.dart';
part 'plantmodel.g.dart';

@HiveType(typeId: 3)
class Plant {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String location;

  @HiveField(3)
  double coins;

  @HiveField(4)
  int verification;

  Plant(
      {required this.coins,
      required this.location,
      required this.name,
      required this.verification,
      this.id});
}
