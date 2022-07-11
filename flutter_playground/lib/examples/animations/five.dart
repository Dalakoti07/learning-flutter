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
      child: Center(
        child: Text(
          _text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
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
          SliverFixedExtentList(
            itemExtent: 70,
            delegate: SliverChildListDelegate([
              _buildFixedList(Colors.cyan, "Cyan"),
              _buildFixedList(Colors.green, "Green"),
              _buildFixedList(Colors.orange, "Orange"),
              _buildFixedList(Colors.amberAccent, "AmberAccent"),
              _buildFixedList(Colors.cyan, "Cyan"),
              _buildFixedList(Colors.green, "Green"),
              _buildFixedList(Colors.orange, "Orange"),
              _buildFixedList(Colors.amberAccent, "AmberAccent"),
              _buildFixedList(Colors.blueGrey, "Blue Grey"),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Add Name',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        _buildName(),
                        const SizedBox(height: 16),
                        RaisedButton(
                          child: const Text('Submit'),
                          onPressed: _submit,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(8),
                color: _randomColor(index),
                child: Center(
                  child: Text(
                    _name[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            }, childCount: _name.length),
          )
        ],
      ),
    );
  }
}

Color _randomColor(int index) {
  if (index % 4 == 0) {
    return Colors.blue;
  } else if (index % 4 == 1) {
    return Colors.orange;
  } else if (index % 4 == 2) {
    return Colors.cyan;
  }
  return Colors.red;
}
