

import 'package:divisor_tensao/divisor.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


// ignore: camel_case_types
class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(children: <Widget>[
      SplashScreen(
        seconds:2,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.blue[900],
          ],
        ),
        navigateAfterSeconds: Tensao(),
        loaderColor: Colors.transparent,
      ),
      Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.adjust_sharp, size: 100, color: Colors.white, ),
          SizedBox(height:20.0),
          Text(
            "Divisor de Tensão",
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              
              
              color: Colors.white,
            ),
          ),
        ],
      ))
    ]));
  }
}
