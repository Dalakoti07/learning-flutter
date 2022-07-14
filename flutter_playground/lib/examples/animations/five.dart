import 'package:flutter/material.dart';
import 'package:flutter_playground/examples/animations/sliver_header.dart';

class ExampleFive extends StatefulWidget {
  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> _name = ['tester'];

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Name'),
      validator: (String? value) {
        if (value?.isEmpty ?? false) {
          return 'Name is required';
        }

        return null;
      },
      onSaved: (String? value) {
        setState(() {
          if (value == null) {
            return;
          }
          _name.add(value);
        });
      },
    );
  }

  Widget _buildFixedList(Color color, String _text) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Text(
            _text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF2F8),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: Text(
              'Flutter Slivers Demo',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            backgroundColor: Color(0xFFEDF2F8),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildFixedList(Colors.cyan, "Cyan"),
              // _buildFixedList(Colors.green, "Green"),
              // _buildFixedList(Colors.orange, "Orange"),
              // _buildFixedList(Colors.amberAccent, "AmberAccent"),
              // _buildFixedList(Colors.cyan, "Cyan"),
              // _buildFixedList(Colors.green, "Green"),
              // _buildFixedList(Colors.orange, "Orange"),
              // _buildFixedList(Colors.amberAccent, "AmberAccent"),
              // _buildFixedList(Colors.blueGrey, "Blue Grey"),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (dContext, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 15,
                  ),
                  child: Text('index: $index'),
                );
              },
              childCount: 5,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: <Widget>[
                Expanded(child: Container()),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter name',
                    ),
                  ),
                ),
                _buildFixedList(Colors.green, 'Hello sliver'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
