import 'package:flutter/material.dart';

class Intro_page1 extends StatelessWidget {
  const Intro_page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.orange[100],
      child: const Center(
        child: Text(
          'Ram Ram!',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    ));
  }
}
