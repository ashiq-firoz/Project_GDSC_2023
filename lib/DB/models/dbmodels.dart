import 'package:hive/hive.dart';
part 'dbmodel.g.dart';

@HiveType(typeId: 1)
class GreenData {
  @HiveField(0)
  double coins;
  @HiveField(1)
  int totalplants;
  @HiveField(2)
  int verifications;

  GreenData(
      {required this.coins,
      required this.totalplants,
      required this.verifications});
}
