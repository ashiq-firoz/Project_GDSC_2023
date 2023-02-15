import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_17/Presentation/screens/blue.dart';
import 'package:project_17/Presentation/widgets/Cards/blue_card.dart';
import 'package:project_17/Presentation/widgets/bottom_widgets/blue_bottom.dart';

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons
              .compost_sharp), //change the icon refer : https://fonts.google.com/icons?selected=Material+Icons

          title: Center(child: Text("Level 1")), //dynamic change to be added

          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor: Colors.blue[200],
        body: SafeArea(child: Text("Fill")),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.charging_station_outlined,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.forest,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.cloud_queue,
                    color: Colors.white,
                  )),
            ],
          ),
        ));
  }
}
