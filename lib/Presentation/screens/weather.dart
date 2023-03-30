import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_17/Presentation/Colors/colors.dart';
import 'package:project_17/Presentation/screens/blue.dart';
import 'package:project_17/Presentation/screens/green.dart';
import 'package:project_17/Presentation/screens/yellow.dart';
import 'package:project_17/Presentation/widgets/bottomContainer.dart';
import 'package:project_17/Presentation/widgets/counter.dart';

import '../Icons/icons.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: colourweather,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          weatherLogo,
          color: Colors.white,
        ),
        title: Text("Level1"),
      ),
      body:
      Column(children: [
        currentWeather(Icons.wb_sunny_rounded,"26.3","Palakkad"),
        SizedBox(height :20.0),
        Text("Additional Information",
        style: TextStyle(fontSize: 24.0,
        color : Color.fromARGB(221, 238, 165, 69),
        fontWeight: FontWeight.bold,
        ),
        ),
        Divider(),
        SizedBox(
          height: 20.0,),
          additionalInformation("24", "2", "1014", "24.6")
      ],),
      bottomNavigationBar: const BottomAppBar(
        color: colorbottomcont,
        child: Bottombar(),
      ),
    );
  }
}

class Weather1 extends StatelessWidget {
  const Weather1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 98, 97, 97),
          Color.fromARGB(255, 92, 92, 92),
          Color.fromARGB(255, 85, 85, 85),
          Color.fromARGB(255, 66, 66, 66),
        ],
        stops: [
          0.1,
          0.25,
          0.4,
          0.9,
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
                //Counter(), //counter.dart
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
                MaterialPageRoute(builder: (context) => const GreenScreen()));
          },
          icon: const Logo(
            icon: greenLogo,
            bgcolor: colourgreen,
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
      ],
    );
  }
}

class Bottomcolumn extends StatelessWidget {
  const Bottomcolumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "hello",
          style: TextStyle(color: colourtext),
        ),
        SizedBox(
          height: 500.0, // change this and fill with content
        )
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [Ilogo(icon: icon1), Text("1")],
        ),
        Row(
          children: [Ilogo(icon: icon2), Text("100")],
        ),
      ],
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
Widget currentWeather(IconData icon,String temp,String location){
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
        color: Colors.orange,
        size : 64.0,
        ),
        SizedBox(
          height : 10.0,
          ),
        Text(
          "$temp",
          style: TextStyle(
            fontSize: 46.0,
             )
        ),
        SizedBox(height:10.0),
        Text("$location",
              style: TextStyle(fontSize: 18.0,color: Color(0xFF5a5a5a),)
        )
      ],),
  );
}
TextStyle titleFont= const TextStyle(fontWeight: FontWeight.w600,fontSize:18.0);
TextStyle infoFont= const TextStyle(fontWeight: FontWeight.w400,fontSize:18.0);

Widget additionalInformation(String wind,String humidity,String pressure,String feels_like){
  
  return Container(
    width : double.infinity,
    padding: EdgeInsets.all(18.0),
    child :Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Wind",style : titleFont,
                  ),
                
                SizedBox(height:18.0),
                Text(
                  "Pressure",
                  style: titleFont,
                  )
              ],),
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$wind",
                style : infoFont,
                  ),
                
                SizedBox(height:18.0),
                Text(
                  "$pressure",
                  style: infoFont,
                  )
              ],
              ),
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Humidity",style : titleFont,
                  ),
                
                SizedBox(height:18.0),
                Text(
                  "Feels Like",
                   style: titleFont,
                  )
              ],
              ),
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$humidity",
                style : infoFont,
                  ),
                
                SizedBox(height:18.0),
                Text(
                  "$feels_like",
                  style: infoFont,
                  )
              ],
              ),
          ],
          )
      ],
    ),
  );
}