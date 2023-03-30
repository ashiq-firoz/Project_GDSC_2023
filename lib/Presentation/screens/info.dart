import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_17/Presentation/screens/blue.dart';
import 'package:project_17/Presentation/screens/next.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Colors/colors.dart';
import '../Icons/icons.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InfoPage(),
    );
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(100, 10, 57, 121),
            Color.fromARGB(100, 16, 121, 56),
            Color.fromARGB(100, 93, 147, 15),
            // Color.fromARGB(100, 0, 0, 0),
            // Color.fromARGB(95, 0, 0, 0),
          ],
          transform: GradientRotation(pi / 2),
        )),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Cardout1(),
                ],
              ),
              const SizedBox(
                height: 80.0,
              ),
              const DefaultTextStyle(
                child: Text("Let's get Started"),
                style: TextStyle(
                    fontFamily: 'MontserratAlternates',
                    fontWeight: FontWeight.w500,
                    fontSize: 30.0,
                    color: colourtext),
              ),
              SizedBox(
                height: 180,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {
                        SharedPreferences b =
                            await SharedPreferences.getInstance();
                        b.setBool("started", true);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext ctx) => BlueScreen()));
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                            fontFamily: 'MontserratAlternates',
                            fontWeight: FontWeight.w500,
                            fontSize: 25.0,
                            color: colourtext),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(118, 27, 94, 31),
                        elevation: 2,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        SharedPreferences b =
                            await SharedPreferences.getInstance();
                        b.setBool("started", true);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext ctx) => NextScreen()));
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            fontFamily: 'MontserratAlternates',
                            fontWeight: FontWeight.w500,
                            fontSize: 25.0,
                            color: colourtext),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(87, 25, 118, 210),
                        elevation: 2,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class Cardout1 extends StatelessWidget {
  const Cardout1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(33.0, 16.0, 2.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color.fromARGB(38, 217, 217, 217),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: YourblueIcon(),
        ),
      ),
    );
  }
}
