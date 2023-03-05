import 'package:flutter/material.dart';

class Controls extends StatelessWidget {
  final child;
  const Controls({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        color: Colors.black,
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
