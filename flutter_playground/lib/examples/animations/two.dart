import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExampleTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Stack(
            children: <Widget>[
              Center(
                child: InkWell(
                  onTap: () {

                  },
                  child: const Icon(Icons.ads_click),
                ),
              ),
              Center(
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: 4 * math.pi),
                  duration: const Duration(seconds: 2),
                  builder: (BuildContext context, double angle, Widget? child) {
                    return Transform.rotate(
                      angle: angle,
                      child: Image.asset('assets/images/bag.png'),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
