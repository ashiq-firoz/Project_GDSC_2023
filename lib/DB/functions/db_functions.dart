import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_17/DB/models/dbmodels.dart';
import 'package:project_17/DB/models/plantmodel.dart';

import '../models/bluemodel.dart';

//Green Database code starts
String greendbname = "GreenData";

ValueNotifier<GreenData> data =
    ValueNotifier(GreenData(coins: 0.000, totalplants: 0, verifications: 0));

int totalPlants = 0;

Future<void> updateGreenData(GreenData data) async {
  final greendb = await Hive.box(greendbname);
  greendb.put("coins", data.coins);
  greendb.put("totalplants", data.totalplants);
  greendb.put("verifications", data.verifications);
  totalPlants = data.totalplants;
}

Future<void> getGreenData() async {
  final greendb = await Hive.box(greendbname);
  data.value.coins = greendb.get("coins", defaultValue: 0.000);
  data.value.totalplants = greendb.get("totalplants", defaultValue: 0);
  data.value.verifications = greendb.get("verifications", defaultValue: 0);

  data.notifyListeners();
}

// Green Database code ends

// Blue database  code starts

String bluedbname = "BlueData";

int Level(double coins) {
  if (coins <= 10)
    return 1;
  else if (coins > 10 && coins <= 20)
    return 2;
  else if (coins > 10 && coins <= 30)
    return 3;
  else if (coins > 10 && coins <= 40)
    return 4;
  else if (coins > 10 && coins <= 50)
    return 5;
  else if (coins > 10 && coins <= 60)
    return 6;
  else if (coins > 10 && coins <= 70)
    return 7;
  else if (coins > 10 && coins <= 80)
    return 8;
  else if (coins > 10 && coins <= 90)
    return 9;
  else if (coins > 10 && coins <= 100) return 10;

  return 1;
}

ValueNotifier<BlueData> bluedata =
    ValueNotifier(BlueData(coins: 0.00, trash: 0, level: "Level 1"));

Future<void> updateBlueData(BlueData data) async {
  final bluedb = await Hive.box(bluedbname);
  bluedb.put("coins", data.coins);
  bluedb.put("trash", data.trash);
  int v = Level(data.coins);
  bluedb.put("level", "Level $v");
}

Future<void> getBlueData() async {
  final bluedb = await Hive.box(bluedbname);
  bluedata.value.coins = bluedb.get("coins", defaultValue: 0.000);
  bluedata.value.trash = bluedb.get("trash", defaultValue: 0);
  bluedata.value.level = bluedb.get("level", defaultValue: "Level 1");

  bluedata.notifyListeners();
}

//blue database code ends

//plant database code starts

String plantdbname = "PlantData";

ValueNotifier<List<Plant>> plantdata = ValueNotifier([]);

Future<void> addplant(Plant data) async {
  final plantdb = await Hive.openBox<Plant>(plantdbname);
  //plantdb.deleteFromDisk();
  data.id = totalPlants;
  await plantdb.add(data);
  getplant();
}

Future<void> getplant() async {
  final plantdb = await Hive.openBox<Plant>(plantdbname);
  plantdata.value.clear();

  plantdata.value.addAll(plantdb.values);
  plantdata.notifyListeners();
}

Future<void> delete() async {
  final d1 = await Hive.openBox<Plant>(plantdbname);
  d1.deleteFromDisk();
}

Future<void> updatePlant(int? id, data) async {
  final plantdb = await Hive.openBox<Plant>(plantdbname);
  if (id != null) {
    id = id - 1;
    plantdb.putAt(id, data);
    getplant();
  }
}
