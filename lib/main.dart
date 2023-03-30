import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_17/DB/functions/db_functions.dart';
import 'package:project_17/DB/models/bluemodel.dart';
import 'package:project_17/DB/models/dbmodels.dart';
import 'package:project_17/DB/models/plantmodel.dart';
import 'package:project_17/Presentation/screens/blue.dart';
import 'package:project_17/Presentation/screens/info.dart';
import 'package:project_17/Presentation/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

String greenbox = "GreenData";
String bluedbname = "BlueData";
String plantdbname = "PlantData";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(greenbox);
  if (!Hive.isAdapterRegistered(GreenDataAdapter().typeId)) {
    Hive.registerAdapter(GreenDataAdapter());
  }
  await Hive.openBox(bluedbname);
  if (!Hive.isAdapterRegistered(BlueDataAdapter().typeId)) {
    Hive.registerAdapter(BlueDataAdapter());
  }
  // h1.deleteFromDisk();
  // h2.deleteFromDisk();
  if (!Hive.isAdapterRegistered(PlantAdapter().typeId)) {
    Hive.registerAdapter(PlantAdapter());
  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Screen(),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(); //SplashScreen();
  }
}
