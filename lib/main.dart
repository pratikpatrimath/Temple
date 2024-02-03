import 'package:flutter/material.dart';
import 'package:ram/screens/onboardingscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: Color.fromRGBO(0, 0, 0, 1)),
        themeMode: ThemeMode.system,
        home: const Onboarding_screen());
  }
}
