import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_17/DB/functions/db_functions.dart';
import 'package:project_17/DB/models/dbmodels.dart';
import 'package:project_17/Presentation/Colors/colors.dart';
import 'package:project_17/Presentation/screens/blue.dart';
import 'package:project_17/Presentation/screens/weather.dart';
import 'package:project_17/Presentation/screens/yellow.dart';
import 'package:project_17/Presentation/widgets/bottomContainer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tflite/tflite.dart';
import '../../DB/models/plantmodel.dart';
import '../Icons/icons.dart';

var validations = 0;
var totalCoins = 0.00;
var totalplants = 0;

// Day difference
int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}
//

// geolocator code starts
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

//geolocator code stops

List<Marker> markerlist = [];

Plant p = Plant(
    coins: 0.00,
    lat: 9.754586,
    lng: 76.2673,
    name: "p1",
    verification: 0,
    dob: DateTime.now());

TextEditingController controller = TextEditingController();

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: colourgreen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const Icon(
          greenLogo,
          color: Colors.white,
        ),
        title: const Text("Level1"),
      ),
      body: const Green1(),
      bottomNavigationBar: const BottomAppBar(
        color: colorbottomcont,
        child: Bottombar(),
      ),
    );
  }
}

class Green1 extends StatelessWidget {
  const Green1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(97, 0, 213, 18),
          Color.fromARGB(95, 0, 184, 16),
          Color.fromARGB(95, 0, 154, 14),
          Color.fromARGB(95, 255, 255, 255),
          // Color.fromARGB(95, 0, 0, 0),
        ],
        stops: [
          0.1,
          0.3,
          0.9,
          0.95,
        ],
        transform: GradientRotation(pi / 2),
      )),
      child: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: data,
          builder: (BuildContext ctx, GreenData c, Widget? child) {
            getGreenData();
            var temp = totalCoins;
            totalCoins = c.coins;
            validations = c.verifications;
            totalplants = c.totalplants;

            return ListView(
              padding: const EdgeInsets.only(top: 0.0),
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Cardout(), //counter.dart
                    const SizedBox(
                      width: 60.0,
                    ),
                    Stats(value: "$totalplants") //stats class defined below
                  ],
                ),
                const Center(
                    child: Text(
                  "Your Plants",
                  style: TextStyle(
                      fontFamily: 'MontserratAlternates',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                )),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Coins",
                      style: TextStyle(
                          fontFamily: 'MontserratAlternates',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ), // friends logo, Ilogo class defined below
                    SizedBox(
                      width: 40.0,
                    ),
                    Text(
                      "Verifications",
                      style: TextStyle(
                          fontFamily: 'MontserratAlternates',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "$totalCoins",
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 40.0,
                    ),
                    Text(
                      "$validations",
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60.0,
                ),
                const Controls(
                  child: Bottomcolumn(),
                ),
              ],
            );
          },
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
                MaterialPageRoute(builder: (context) => const BlueScreen()));
          },
          icon: const Logo(
            icon: blueLogo,
            bgcolor: colourblue,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const YellowScreen()));
          },
          icon: const Logo(
            icon: yellowLogo,
            bgcolor: colouryellow,
          ),
        ),
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

class Bottomcolumn extends StatefulWidget {
  const Bottomcolumn({super.key});

  @override
  State<Bottomcolumn> createState() => _BottomcolumnState();
}

class _BottomcolumnState extends State<Bottomcolumn> {
  late File _img;
  String out = "";
  getimage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _img = File(img!.path);
    });
    runModel();
  }

  runModel() async {
    await Tflite.loadModel(
        model: "assets/model2.tflite", labels: "assets/labels2.txt");
    var predict = await Tflite.runModelOnImage(
      path: _img.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.1,
      asynch: true,
    );
    SharedPreferences detected = await SharedPreferences.getInstance();
    predict!.forEach((element) {
      out = element["label"];
      if (out == "0 tree") {
        setState(() {
          totalCoins = totalCoins + 0.001;
          totalCoins = double.parse(totalCoins.toStringAsFixed(3));
          validations = validations + 1;
          data.value.coins = totalCoins;
          data.value.totalplants = totalplants + 1;
          data.value.verifications = validations;
          updateGreenData(data.value);
          data.notifyListeners();
          p.coins = 0.001;
          p.verification = 1;
          //addplant(p);
          plantdata.notifyListeners();
        });
        detected.setBool("greenfound", true);
      } else {
        detected.setBool("greenfound", false);
      }
    });
  }

  // start google maps section
  late GoogleMapController mapController;

  void getmarker() async {
    await getplant();
    setState(() {
      plantdata.value.forEach((element) {
        //print(element.lat);
        markerlist.add(Marker(
            markerId: MarkerId(element.name),
            position: LatLng(element.lat, element.lng)));
      });
    });
  }

  final LatLng _center = const LatLng(40.5853, -122.3949);
  List<Marker> marker = const [
    Marker(
        markerId: MarkerId("Kochi"),
        position: LatLng(9.9312, 76.2673),
        infoWindow: InfoWindow(
          title: "Kochi",
        )),
    Marker(
        markerId: MarkerId("Trivandrum"),
        position: LatLng(8.5241, 76.9366),
        infoWindow: InfoWindow(
          title: "Trivandrum",
        )),
    Marker(
        markerId: MarkerId("Goa"),
        position: LatLng(15.2993, 74.1240),
        infoWindow: InfoWindow(
          title: "Goa",
        )),
    Marker(
        markerId: MarkerId("Alappuzha"),
        position: LatLng(9.4981, 76.3388),
        infoWindow: InfoWindow(
          title: "Alappuzha",
        )),
    Marker(
        markerId: MarkerId("KTYM"),
        position: LatLng(9.754586, 76.649583),
        infoWindow: InfoWindow(
          title: "IIIT Kottayam",
        ))
  ];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

//end google maps section
  @override
  Widget build(BuildContext context) {
    void showSnackBar(BuildContext context) async {
      SharedPreferences detect = await SharedPreferences.getInstance();

      const snackBar = SnackBar(
        content: Text("Not Verified"),
        backgroundColor: errcolor,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 10),
        elevation: 30,
      );

      bool b = detect.getBool("greenfound")!;

      if (b) {
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return const Name();
            });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Column(
      children: [
        const SizedBox(
          height: 30.0,
        ),

        GestureDetector(
          onTap: () async {
            await getimage();
            showSnackBar(context);
          },
          child: const Ilogo(icon: Icons.add_a_photo_outlined, size: 60.0),
        ),

        const Center(
            child: Text(
          "Add a plant", //"Verify your plants"
          style: TextStyle(
              fontFamily: 'MontserratAlternates',
              fontWeight: FontWeight.w500,
              fontSize: 30.0,
              color: colourtext),
        )),
        // const Center(
        //     child: Text(
        //   "Verify nearby plant", //"Verify your plants"
        //   style: TextStyle(fontSize: 30.0, color: colourtext),
        // )),
        const SizedBox(
          height: 60.0,
        ),

        //map widget should be placed here
        //Google maps widget
        SizedBox(
          height: 600,
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 6.0,
            ),
            markers: Set.of(markerlist),
          ),
        ),

        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            children: [
              MerchCard(),
              MerchCard(),
              MerchCard(),
              MerchCard(),
            ],
          ),
        ),
        const SizedBox(
          height: 80.0,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: Text(
              "Your Plants",
              style: TextStyle(
                color: colourtext,
                fontSize: 40.0,
              ),
            ),
          ),
        ),
        SizedBox(
            height: 400,
            child: ValueListenableBuilder(
              valueListenable: plantdata,
              builder: (BuildContext ctx, List<Plant> data, Widget? child) {
                getplant();
                return ListView.separated(
                    itemBuilder: (ctx, index) {
                      var c = data[index].coins;
                      // print("id : -> ");
                      // print(data[index].id);
                      return Plants(
                        stage: "Newbi",
                        coins: "$c",
                        name: data[index].name,
                        data: data[index],
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const SizedBox(
                        height: 40.0,
                      );
                    },
                    itemCount: data.length);
              },
            )),
        const SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}

class Stats extends StatelessWidget {
  final value;
  final size = 50.0;
  const Stats({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 50.0,
      ),
    );
  }
}

class Ilogo extends StatelessWidget {
  final icon;
  final size;
  const Ilogo({super.key, required this.icon, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22.0, 22.0, 22.0, 8.0),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: coloriconbg,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Icon(
            icon,
            size: size,
          ),
        ),
      ),
    );
  }
}

//Your plants
class Plants extends StatefulWidget {
  final stage;
  final coins;
  final name;
  final Plant data;
  const Plants(
      {super.key,
      required this.stage,
      required this.coins,
      required this.name,
      required this.data});

  @override
  State<Plants> createState() => _PlantsState();
}

class _PlantsState extends State<Plants> {
  late File _img;
  String out = "";
  getimage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _img = File(img!.path);
    });
    runModel();
  }

  runModel() async {
    await Tflite.loadModel(
        model: "assets/model2.tflite", labels: "assets/labels2.txt");
    var predict = await Tflite.runModelOnImage(
      path: _img.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.1,
      asynch: true,
    );
    SharedPreferences detected = await SharedPreferences.getInstance();
    predict!.forEach((element) {
      out = element["label"];
      if (out == "0 tree") {
        setState(() {
          totalCoins = totalCoins + 0.001;
          totalCoins = double.parse(totalCoins.toStringAsFixed(3));
          validations = validations + 1;
          data.value.coins = totalCoins;
          data.value.totalplants = totalplants;
          data.value.verifications = validations;
          updateGreenData(data.value);
          data.notifyListeners();
          p.coins = 0.001 + widget.data.coins;
          p.verification = 1 + widget.data.verification;
          p.name = widget.data.name;
          p.id = widget.data.id;
          updatePlant(widget.data.id, p);
          plantdata.notifyListeners();
        });
        detected.setBool("greenfound", true);
      } else {
        detected.setBool("greenfound", false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void showmessagebar() async {
      String message = "";
      var color;
      SharedPreferences detect = await SharedPreferences.getInstance();
      bool? b = detect.getBool("greenfound");

      if (b!) {
        message = "Done";
        color = successcolor;
      } else {
        message = "Not Verified";
        color = errcolor;
      }
      final snackBar = SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        elevation: 30,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void shower() {
      int d = 5 - daysBetween(widget.data.dob, DateTime.now());
      String message = "Wait for $d days";
      final bar = SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: colourtext),
        ),
        backgroundColor: errcolor,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        elevation: 30,
      );
      ScaffoldMessenger.of(context).showSnackBar(bar);
    }

    var boxcolor = Colors.grey[700];
    bool ready = false;
    int diff = daysBetween(widget.data.dob, DateTime.now());
    if (diff >= 5) {
      boxcolor = successcolor;
      ready = true;
    } else {
      ready = false;
    }

    return Container(
      decoration: BoxDecoration(
        color: boxcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.forest_rounded,
          color: colouricon,
          size: 30,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.name,
              style: const TextStyle(color: colourtext),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Stage",
                  style: TextStyle(color: colourtext),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.stage,
                  style: const TextStyle(color: colourtext),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Coins earned",
                  style: TextStyle(color: colourtext),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.coins,
                  style: const TextStyle(color: colourtext),
                )
              ],
            )
          ],
        ),
        trailing: IconButton(
            onPressed: () async {
              if (ready) {
                await getimage();
                showmessagebar();
              } else {
                shower();
              }
            },
            icon: const Icon(
              Icons.camera,
              color: colouricon,
            )),
      ),
    );
  }
}

//cardout

class Cardout extends StatelessWidget {
  const Cardout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(33.0, 16.0, 2.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color.fromARGB(125, 217, 217, 217),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: YourtreeIcon(),
        ),
      ),
    );
  }
}

//merch card ads

class MerchCard extends StatelessWidget {
  const MerchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(33.0, 16.0, 2.0, 0.0),
      child: GestureDetector(
        onTap: () => {print("hello merch")}, //change it to scroll down
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color.fromARGB(255, 231, 229, 229),
          ),
          child: Image(image: AssetImage("assets/images/ad.jpeg")),
        ),
      ),
    );
  }
}

class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: successcolor,
      height: 280.0,
      child: Column(
        children: [
          SizedBox(
            height: 60.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Plant name : ",
                style: TextStyle(color: colourtext),
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      hintText: "Enter the plant name"),
                  controller: controller,
                ),
              )
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
          Center(
              child: TextButton(
            child: Text(
              "Done",
              style: TextStyle(color: colourtext),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal,
            ),
            onPressed: () {
              p.name = controller.text;
              _determinePosition().then((value) {
                p.lat = value.latitude;
                p.lng = value.longitude;
                print("new lat long ::");
                print(p.lat);
                print(p.lng);
              });
              p.dob = DateTime.now();
              addplant(p);

              Navigator.pop(context);
            },
          ))
        ],
      ),
    );
  }
}
