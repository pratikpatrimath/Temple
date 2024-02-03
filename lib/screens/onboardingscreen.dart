import 'package:flutter/material.dart';
import 'package:ram/screens/home.dart';
import 'package:ram/screens/intro_page1.dart';
import 'package:ram/screens/intro_page2.dart';
import 'package:ram/screens/intro_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding_screen extends StatefulWidget {
  const Onboarding_screen({super.key});

  @override
  State<Onboarding_screen> createState() => _Onboarding_screenState();
}

class _Onboarding_screenState extends State<Onboarding_screen> {
  //keeping track of page
  PageController _controller = PageController();
  //omn last page
  bool lastpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          onPageChanged: (Index) {
            setState(() {
              lastpage = (Index == 2);
            });
          },
          controller: _controller,
          children: const [
            Intro_page1(),
            Intro_page2(),
            Intro_page3(),
          ],
        ),

        //dot indicator
        Container(
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(3);
                    },
                    child: const Text(
                      'SKIP',
                      style: TextStyle(color: Colors.black),
                    )),
                SmoothPageIndicator(controller: _controller, count: 3),
                lastpage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        },
                        child: const Text('DONE',
                            style: TextStyle(color: Colors.black)))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text('NEXT',
                            style: TextStyle(color: Colors.black)))
              ],
            ))
      ]),
    );
  }
}
