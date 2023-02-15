import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BlueCard extends StatelessWidget {
  const BlueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Text("Photo"),
          color: Colors.black,
        )
      ],
    );
  }
}
