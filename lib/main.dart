import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_17/DB/models/dbmodels.dart';
import 'package:project_17/Presentation/screens/blue.dart';

String greenbox = "GreenData";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(greenbox);
  if (!Hive.isAdapterRegistered(GreenDataAdapter().typeId)) {
    Hive.registerAdapter(GreenDataAdapter());
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
    return BlueScreen();
  }
}
