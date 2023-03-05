import 'package:flutter/material.dart';
import 'package:project_17/Presentation/Colors/colors.dart';
import 'package:project_17/Presentation/screens/weather.dart';
import 'package:project_17/Presentation/screens/yellow.dart';
import 'package:project_17/Presentation/widgets/bottomContainer.dart';
import 'package:project_17/Presentation/widgets/counter.dart';

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colourgreen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const Icon(
          Icons.water_drop,
          color: Colors.white,
        ),
        title: Text("Level1"),
      ),
      body: const Blue1(),
      bottomNavigationBar: BottomAppBar(
        color: colorbottomcont,
        child: Bottombar(),
      ),
    );
  }
}

class Blue1 extends StatelessWidget {
  const Blue1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          const Controls(
            child: bottomColumn(),
          ),
        ],
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
                  MaterialPageRoute(builder: (context) => YellowScreen()));
            },
            icon: Icon(
              Icons.cloud,
              color: colouricon,
            )),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GreenScreen()));
            },
            icon: Icon(
              Icons.cloud,
              color: colouricon,
            )),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WeatherScreen()));
            },
            icon: Icon(
              Icons.cloud,
              color: colouricon,
            )),
      ],
    );
  }
}

class bottomColumn extends StatelessWidget {
  const bottomColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "hello",
          style: TextStyle(color: colourtext),
        ),
        SizedBox(
          height: 320.0, // change this and fill with content
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
