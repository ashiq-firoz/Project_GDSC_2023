import 'package:flutter/material.dart';

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
          color: Color.fromARGB(80, 0, 0, 0),
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
