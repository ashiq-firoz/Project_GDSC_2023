import 'package:flutter/material.dart';

const camIcon = Icons.add_a_photo_outlined;

const blueLogo = Icons.water_drop;
const greenLogo = Icons.yard_outlined;
const yellowLogo = Icons.energy_savings_leaf_outlined;
const weatherLogo = Icons.nights_stay_outlined;

//widgets

// usage -> child/icon : Logo(colourblue,bluelogo),

class Logo extends StatelessWidget {
  final bgcolor;
  final icon;

  final width = 50.0;
  final height = 50.0; //use decimal value

  const Logo({super.key, required this.bgcolor, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgcolor,
      ),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}

// Your trees card icon
class YourtreeIcon extends StatelessWidget {
  const YourtreeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.forest_rounded,
      color: Colors.black,
      size: 120.0,
    );
  }
}

class YourblueIcon extends StatelessWidget {
  const YourblueIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.scatter_plot_outlined,
      color: Colors.black,
      size: 120.0,
    );
  }
}
