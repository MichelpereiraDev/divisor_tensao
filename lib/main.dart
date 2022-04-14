import 'package:divisor_tensao/divisor.dart';
import 'package:divisor_tensao/splash.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Divisor de Tensão',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:splash());
  }
}
