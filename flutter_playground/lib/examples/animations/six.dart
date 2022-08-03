import 'package:flutter/material.dart';
import 'package:flutter_playground/examples/animations/cart_bottom.dart';

class ExampleSix extends StatefulWidget {
  @override
  State<ExampleSix> createState() => _ExampleSixState();
}

class _ExampleSixState extends State<ExampleSix> {
  int count = 0;

  var itemData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                    itemCount: itemData.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 80,
                        child: Text("Text :" + index.toString()),
                      );
                    }),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.cyan),
                  padding: EdgeInsets.all(10),
                  height: 60,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
