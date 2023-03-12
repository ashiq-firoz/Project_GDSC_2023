import 'package:flutter/material.dart';

const camIcon = Icons.camera_alt_rounded;

const blueLogo = Icons.water_drop;
const greenLogo = Icons.forest_rounded;
const yellowLogo = Icons.charging_station_outlined;
const weatherLogo = Icons.cloud;

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
