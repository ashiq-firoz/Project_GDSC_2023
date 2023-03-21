import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_17/DB/functions/db_functions.dart';
import 'package:project_17/DB/models/bluemodel.dart';
import 'package:project_17/Presentation/Colors/colors.dart';
import 'package:project_17/Presentation/Icons/icons.dart';
import 'package:project_17/Presentation/screens/green.dart';
import 'package:project_17/Presentation/screens/weather.dart';
import 'package:project_17/Presentation/screens/yellow.dart';
import 'package:project_17/Presentation/widgets/bottomContainer.dart';
import 'package:project_17/Presentation/widgets/counter.dart';
import 'package:tflite/tflite.dart';
import '../../DB/models/dynamic.dart';

var trashCount = 0;
var coinCount = 0.00;

ValueNotifier<Countdata> Count =
    ValueNotifier(Countdata(coinCount: 0.00, validation: 0));

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        
        extendBodyBehindAppBar: true,
        backgroundColor: colourblue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: const Icon(
            blueLogo,
            color: Colors.white,
          ),
          title: ValueListenableBuilder(
            valueListenable: bluedata,
            builder: (BuildContext ctx1, BlueData data, Widget? child) {
              return Text(data.level);
            },
          ),
        ),
        body: const Blue1(),
        bottomNavigationBar: const BottomAppBar(
          color: colorbottomcont,
          child: Bottombar(),
        ),
      ),
    );
  }
}

class Blue1 extends StatelessWidget {
  const Blue1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [
              0.1,
              0.25,
              0.4,
              0.9,
            ],
        colors: [
          Color.fromARGB(99, 0, 38, 255),
          Color.fromARGB(98, 0, 31, 206),
          Color.fromARGB(97, 0, 22, 145),
          Color.fromARGB(97, 1, 13, 85),
        ],
        transform: GradientRotation(pi / 2),
      )),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Counter(), //counter.dart
                SizedBox(
                  width: 60.0,
                ),
                Stats(
                    icon1: Icons.currency_rupee,
                    icon2: Icons.recycling) //stats class defined below
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Ilogo(
                    icon: Icons
                        .new_releases), // friends logo, Ilogo class defined below
                SizedBox(
                  width: 40.0,
                ),
                Ilogo(icon: Icons.map_outlined),
              ],
            ),
            const SizedBox(
              height: 110,
            ),
            const Controls(
              child: Bottomcolumn(),
            ),
          ],
        ),
      ),
    );
  }
}

//widgets start

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //icons should be changed
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const YellowScreen()));
          },
          // icon: const Icon(
          //   yellowLogo,
          //   color: colouricon,
          // )
          icon: const Logo(
            icon: yellowLogo,
            bgcolor: colouryellow,
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const GreenScreen()));
            },
            icon: const Logo(
              icon: greenLogo,
              bgcolor: colourgreen,
            )),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WeatherScreen()));
          },
          icon: const Logo(
            icon: weatherLogo,
            bgcolor: colourweather,
          ),
        ),
      ],
    );
  }
}

class Bottomcolumn extends StatelessWidget {
  const Bottomcolumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "",
          style: TextStyle(color: colourtext),
        ),
        SizedBox(
          height: 40.0, // change this and fill with content
        ),
        CameraIcon(),
        SizedBox(
          height: 40.0, // change this and fill with content
        ),
      ],
    );
  }
}

class Stats extends StatelessWidget {
  final icon1;
  final icon2;
  const Stats({super.key, required this.icon1, required this.icon2});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: bluedata,
      builder: (BuildContext ctx, BlueData val, Widget? child) {
        coinCount = val.coins;
        trashCount = val.trash;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [Ilogo(icon: icon1), Text("$coinCount")],
            ),
            Row(
              children: [Ilogo(icon: icon2), Text("$trashCount")],
            ),
          ],
        );
      },
    );
  }
}

class Ilogo extends StatelessWidget {
  final icon;
  const Ilogo({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Container(
        decoration: BoxDecoration(
          color: coloriconbg,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}

class CameraIcon extends StatefulWidget {
  const CameraIcon({super.key});

  @override
  State<CameraIcon> createState() => _CameraIconState();
}

class _CameraIconState extends State<CameraIcon> {
  final width = 150.0;

  final height = 150.0;

  //use double ,ie: decimal values
  final iconsize = 100.0;

  String out = "";
  File? _img;

  loadimage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    //print(image?.path);
    setState(() {
      _img = File(image!.path);
      //print(_img!.path);
      runModel();
    });
  }

  runModel() async {
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt");
    var perdict = await Tflite.runModelOnImage(
      path: _img!.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.1,
      asynch: true,
    );
    await Tflite.close();
    //print("prediction ");
    perdict!.forEach((element) {
      setState(() {
        out = element["label"];
        //print(out);
        if (out == "0 trash") {
          //print("trash");
          coinCount = coinCount + 0.001;
          trashCount = trashCount + 1;

          bluedata.value.coins = totalCoins;
          bluedata.value.trash = trashCount;
          updateBlueData(bluedata.value);
          bluedata.notifyListeners();
        }
        //print(out);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: coloriconbtmbg,
        shape: BoxShape.circle,
      ),
      child: IconButton(
          onPressed: () {
            loadimage();
          },
          icon: const Icon(
            camIcon,
            color: colouricon,
            size: 100.0,
          )),
    );
  }
}
