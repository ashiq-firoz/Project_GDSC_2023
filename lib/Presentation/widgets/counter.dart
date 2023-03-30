import 'package:flutter/material.dart';
import 'package:project_17/DB/functions/db_functions.dart';

import '../../DB/models/bluemodel.dart';

class Counter extends StatelessWidget {
  Counter({super.key});

  int trashcount = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: bluedata,
      builder: (BuildContext ctx, BlueData data, Widget? child) {
        trashcount = data.trash;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              child: Container(
            width: 140.0,
            height: 140.0,
            decoration: const BoxDecoration(
              color: Color.fromARGB(80, 0, 0, 0),
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "$trashcount", //data count
                      style: const TextStyle(
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
      },
    );
  }
}
