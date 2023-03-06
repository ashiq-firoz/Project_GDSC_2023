import 'package:flutter/material.dart';
import 'package:project_17/Presentation/Colors/colors.dart';
import 'package:project_17/Presentation/Icons/icons.dart';

class CameraIcon extends StatelessWidget {
  const CameraIcon({super.key});

  final width = 150.0;
  final height = 150.0; //use double ,ie: decimal values
  final iconsize = 100.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: coloriconbtmbg,
        shape: BoxShape.circle,
      ),
      child: IconButton(
          onPressed: () {},
          icon: const Icon(
            camIcon,
            color: colouricon,
            size: 100.0,
          )),
    );
  }
}
