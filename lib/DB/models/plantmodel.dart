import 'package:hive_flutter/adapters.dart';
part 'plantmodel.g.dart';

@HiveType(typeId: 3)
class Plant {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double lat;

  @HiveField(3)
  double lng;

  @HiveField(4)
  double coins;

  @HiveField(5)
  int verification;

  @HiveField(6)
  DateTime dob;

  Plant(
      {required this.coins,
      required this.lat,
      required this.lng,
      required this.name,
      required this.verification,
      required this.dob,
      this.id});
}
