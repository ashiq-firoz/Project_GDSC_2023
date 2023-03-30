import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_17/Presentation/Colors/colors.dart';
import 'package:project_17/Presentation/Icons/icons.dart';
import 'package:project_17/Presentation/screens/blue.dart';
import 'package:project_17/Presentation/screens/info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 0, 28),
      body: Page(),
      bottomNavigationBar: BottomAppBar(
        child: Bar(),
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences b = await SharedPreferences.getInstance();
      if (b.getBool("started") == true) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext ctx) => BlueScreen()));
      }

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext ctx) => InfoScreen()));
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Logos(color: colourblue, icon: blueLogo),
            Logos(color: colouryellow, icon: yellowLogo),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Logos(color: colourgreen, icon: greenLogo),
            Logos(color: colourweather, icon: weatherLogo),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "ESSE",
              style: TextStyle(
                  fontFamily: 'MontserratAlternates',
                  fontWeight: FontWeight.w500,
                  fontSize: 30.0,
                  color: colourtext),
            ),
          ),
        )
      ],
    );
  }
}

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: Container(
        color: const Color.fromARGB(255, 3, 0, 28),
        child: const Center(
          child: Text(
            "Your life,your Earth",
            style: TextStyle(
                fontFamily: 'MontserratAlternates',
                fontWeight: FontWeight.w500,
                fontSize: 28.0,
                color: colourtext),
          ),
        ),
      ),
    );
  }
}

class Logos extends StatelessWidget {
  final color;
  final icon;
  const Logos({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Container(
          width: 98,
          height: 98,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
