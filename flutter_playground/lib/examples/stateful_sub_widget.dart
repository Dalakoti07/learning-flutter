import 'package:flutter/material.dart';
import 'package:flutter_playground/examples/my_event_bus.dart';

class StateFullSubWidget extends StatefulWidget {
  int index;

  StateFullSubWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<StateFullSubWidget> createState() => _StateFullSubWidgetState();
}

class _StateFullSubWidgetState extends State<StateFullSubWidget> {

  var clickedButton = <int>[];

  @override
  void initState() {
    super.initState();
    debugPrint(
      'init called for ${widget.index} ... ',
    );
    myEventBus.on<int>().listen((event) {
      setState((){
        clickedButton.add(event);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      color: Colors.blue,
      child: InkWell(
        onTap: (){
          myEventBus.fire(widget.index);
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Text('Index is: ${widget.index} ck: $clickedButton'),
        ),
      ),
    );
  }
}
