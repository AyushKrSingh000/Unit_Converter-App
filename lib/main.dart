// ignore_for_file: prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:demo_2/pages/area_calc.dart';
import 'package:demo_2/pages/home.dart';
import 'package:demo_2/pages/length_calc.dart';
import 'package:demo_2/pages/main_home.dart';
import 'package:demo_2/pages/mass_calc.dart';
import 'package:demo_2/pages/temp_calc.dart';
import 'package:demo_2/pages/time_calc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter App',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: Colors.white,
        primarySwatch: Colors.orange,
      ),
      home: Home(),
      initialRoute: "/",
      routes: {
        "/home": (context) => HomePage(),
        "/length": (context) => lengthCalc(),
        "/mass": (context) => massCalc(),
        "/area": (context) => areaCalc(),
        "/temperature": (context) => tempCalc(),
        "/time": (context) => timeCalc(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
