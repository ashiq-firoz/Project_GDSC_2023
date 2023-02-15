import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_17/Presentation/widgets/Cards/blue_card.dart';

class BlueBottom extends StatelessWidget {
  const BlueBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: BlueCard(),
    );
  }
}
