import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/Views/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pingy News',
        home: AnimatedSplashScreen(
            duration: 1500,
            splash: Text(
              "Pingy",
              style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 15.0,),
            ),
            nextScreen: Home(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.rightToLeftWithFade,
            backgroundColor: Colors.blue));
  }
}
