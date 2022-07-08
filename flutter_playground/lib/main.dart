import 'package:flutter/material.dart';
import 'package:flutter_playground/examples/animations/one.dart';
import 'package:flutter_playground/examples/animations/three.dart';
import 'package:flutter_playground/examples/animations/two.dart';
import 'package:flutter_playground/examples/no_example.dart';

void main() => runApp(MaterialApp(home: DemoApp()));

class DemoApp extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(body: SimpleWidget());
}

class SimpleWidget extends StatefulWidget {
  @override
  State<SimpleWidget> createState() => _SimpleWidgetState();
}

class _SimpleWidgetState extends State<SimpleWidget> {
  @override
  void initState() {
    super.initState();
  }

  void goToExample(int index) {
    Widget selectedPage = NoExample();
    switch (index) {
      case 1:
        {
          selectedPage = ExampleOne();
        }
        break;
      case 2:
        {
          selectedPage = ExampleTwo();
        }
        break;
      case 3:
        {
          selectedPage = ExampleThree();
        }
        break;
      default:{

      }
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => selectedPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              goToExample(index+1);
            },
            child: Container(
              margin: const EdgeInsets.all(4),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Example ${index + 1}'),
                ),
              ),
            ),
          );
        });
  }
}
