import 'package:flutter/material.dart';

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 52, 152, 219),
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
        color: Colors.black,
        child: Row(
          children: [
            //icons should be changed
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.cloud,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.cloud,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.cloud,
                  color: Colors.white,
                )),
          ],
        ),
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
              Counter(),
              SizedBox(
                width: 60.0,
              ),
              Stats(icon1: Icons.currency_rupee, icon2: Icons.recycling)
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Ilogo(icon: Icons.new_releases), // friends logo
              SizedBox(
                width: 40.0,
              ),
              Ilogo(icon: Icons.map_outlined),
            ],
          ),
          Controls(),
        ],
      ),
    );
  }
}

//widgets start

class Controls extends StatelessWidget {
  const Controls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        color: Colors.black,
      ),
      child: Center(
          child: Column(
        children: [
          Text(
            "hello",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 180.0, // change this and fill with content
          )
        ],
      )),
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
          color: Color.fromARGB(66, 149, 181, 241),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          child: Container(
        width: 140.0,
        height: 140.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(160, 0, 0, 0),
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "1000", //data count
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0, //font size
                  ),
                ),
              ),
            )
          ],
        ),
      )

          ///fill here
          ),
    );
  }
}
