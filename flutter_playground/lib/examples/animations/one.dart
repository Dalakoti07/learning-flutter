import 'package:flutter/material.dart';

class ExampleOne extends StatefulWidget{

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  var _bigger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: AnimatedContainer(
              width: _bigger ? 500 : 100,
              child: Image.asset('assets/images/bag.png',),
              duration: const Duration(seconds: 1),
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      colors: const [Colors.purple, Colors.transparent],
                      stops: [ _bigger ? 0.2 : 0.5, 1.0])
              ),
              /// https://api.flutter.dev/flutter/animation/Curves-class.html
              curve: Curves.decelerate,
            ),
          ),
          MaterialButton(
            minWidth: double.infinity,
            onPressed: () => setState(() {
              _bigger = !_bigger;
            }),
            child: const Icon(Icons.ads_click),
          ),
        ],
      ),
    );
  }
}