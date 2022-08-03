import 'package:flutter/material.dart';
import 'package:flutter_playground/examples/stateful_sub_widget.dart';

class ExampleSeven extends StatefulWidget {
  @override
  State<ExampleSeven> createState() => _ExampleSevenState();
}

class _ExampleSevenState extends State<ExampleSeven> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Its a toolbar'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, indx) {
          return StateFullSubWidget(index: indx,);
        },
        itemCount: 30,
      ),
    );
  }
}
