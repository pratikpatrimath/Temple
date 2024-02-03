import 'package:flutter/material.dart';

class Intro_page2 extends StatelessWidget {
  const Intro_page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange[100],
        child: const Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Get to know',
                    style: TextStyle(fontSize: 30, color: Colors.black)),
                Text(' the history of',
                    style: TextStyle(fontSize: 30, color: Colors.black)),
                Text(' the Ram Mandir.',
                    style: TextStyle(fontSize: 30, color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
