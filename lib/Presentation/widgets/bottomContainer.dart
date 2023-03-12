import 'package:flutter/material.dart';
import 'package:project_17/Presentation/Colors/colors.dart';

class Controls extends StatelessWidget {
  final child;
  const Controls({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        color: colorbottomcont,
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
