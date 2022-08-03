import 'package:flutter/material.dart';

class StateFullSubWidget extends StatefulWidget {
  int index;

  StateFullSubWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<StateFullSubWidget> createState() => _StateFullSubWidgetState();
}

class _StateFullSubWidgetState extends State<StateFullSubWidget> {
  @override
  void initState() {
    super.initState();
    debugPrint(
      'init called for ${widget.index} ... ',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Text('Index is: ${widget.index}'),
      ),
    );
  }
}
