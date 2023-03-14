import 'package:flutter/material.dart';
import 'package:project_17/Presentation/Colors/colors.dart';
import 'package:project_17/Presentation/screens/blue.dart';
import 'package:project_17/Presentation/screens/weather.dart';
import 'package:project_17/Presentation/screens/yellow.dart';
import 'package:project_17/Presentation/widgets/bottomContainer.dart';
import '../Icons/icons.dart';

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
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(top: 0.0),
        children: [
          const SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Cardout(), //counter.dart
              SizedBox(
                width: 60.0,
              ),
              Stats(value: "0") //stats class defined below
            ],
          ),
          const Center(
              child: Text(
            "Your Plants",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          )),
          const SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                "Coins",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ), // friends logo, Ilogo class defined below
              SizedBox(
                width: 40.0,
              ),
              Text(
                "Verifications",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                "1",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 40.0,
              ),
              Text(
                "100",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
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

class Bottomcolumn extends StatelessWidget {
  const Bottomcolumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30.0,
        ),
        const Ilogo(icon: Icons.add_a_photo_outlined, size: 60.0),
        const Center(
            child: Text(
          "Add a plant", //"Verify your plants"
          style: TextStyle(fontSize: 30.0, color: colourtext),
        )),
        const Center(
            child: Text(
          "Verify nearby plant", //"Verify your plants"
          style: TextStyle(fontSize: 30.0, color: colourtext),
        )),
        const SizedBox(
          height: 60.0,
        ),

        //map widget should be placed here

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
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              //change this to a function generating list after adding db
              Plants(
                stage: "newbi",
                coins: "10",
                name: "p1",
              ),
              SizedBox(
                height: 40.0,
              ),
              Plants(
                stage: "newbi",
                coins: "10",
                name: "p1",
              ),
              SizedBox(
                height: 40.0,
              ),
              Plants(
                stage: "newbi",
                coins: "10",
                name: "p1",
              ),
              SizedBox(
                height: 40.0,
              ),
              Plants(
                stage: "newbi",
                coins: "10",
                name: "p1",
              ),
              SizedBox(
                height: 40.0,
              ),
              Plants(
                stage: "newbi",
                coins: "10",
                name: "p1",
              ),
            ],
          ),
        ),
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
class Plants extends StatelessWidget {
  final stage;
  final coins;
  final name;
  const Plants(
      {super.key,
      required this.stage,
      required this.coins,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[700],
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
              name,
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
                  stage,
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
                  coins,
                  style: const TextStyle(color: colourtext),
                )
              ],
            )
          ],
        ),
        trailing: IconButton(
            onPressed: () {},
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
      child: GestureDetector(
        onTap: () => {print("hello")}, //change it to scroll down
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
