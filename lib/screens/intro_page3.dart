import 'package:flutter/material.dart';

class Intro_page3 extends StatelessWidget {
  const Intro_page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.orange[100],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/shri-ram-38.png', height: 300, width: 300),
            const SizedBox(
              height: 5,
            ),
            const Text('Jay Shree Ram!',
                style: TextStyle(fontSize: 30, color: Colors.black)),
          ],
        ),
      ),
    ));
  }
}
