import 'package:flutter/material.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
          padding: const EdgeInsets.all(30.0),
          children:[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.asset('assets/fooderlich_assets/empty_list.png'),
                ),
                const SizedBox(height: 16.0),
                const Text('No Groceries', style: TextStyle(fontSize: 21.0),),
                const SizedBox(height: 16.0),
                const Text(
                  'Shopping for ingredients?\n'
                      'Tap the + button to write them down!',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                MaterialButton(
                  textColor: Colors.white,
                  child: const Text('Browse Recipes'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),),
                  color: Colors.green,
                  onPressed: () {
                    // TODO 8: Go to Recipes Tab
                  },
                ),
              ],
            ),
          ]
        ),
    );
  }
}
