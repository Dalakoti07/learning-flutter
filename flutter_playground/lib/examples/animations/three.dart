import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExampleThree extends StatefulWidget {
  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  double _newValue = .4;

  Color _newColor = Colors.white;

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
                child: TweenAnimationBuilder<Color?>(
                  // <-- Color might be null
                  tween: ColorTween(begin: Colors.yellow, end: _newColor),
                  duration: const Duration(seconds: 2),
                  builder: (_, Color? color, __) {
                    // <-- Color might be null
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            color ?? Colors.transparent,
                            // <-- If color is null - pass transparent
                            BlendMode.modulate,
                          ),
                          image: const NetworkImage(
                            'https://as1.ftcdn.net/v2/jpg/01/75/96/60/1000_F_175966058_HhcjbrlAwWvdodij0qevJiZMVOBtBtGI.jpg',
                          ),
                        ),
                      ),
                      child: Container(),
                    );
                  },
                ),
              ),
            ],
          ),
          Slider.adaptive(
            value: _newValue,
            onChanged: (double value) {
              setState(
                () {
                  _newValue = value;
                  _newColor = Color.lerp(Colors.yellow, Colors.red, value)!;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
