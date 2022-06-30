// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:demo_2/utils/area.dart';
import 'package:demo_2/utils/length.dart';
import 'package:demo_2/utils/temperature.dart';
import 'package:demo_2/utils/time.dart';
import 'package:flutter/material.dart';

import '../utils/mass.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 10.0,
        shadowColor: Colors.white,
        title: Center(
            child: Text(
          "Unit Converter App",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        )),
        backgroundColor: Colors.white,
        toolbarHeight: 60.00,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            Row(
              children: [
                lengthConverter(),
                SizedBox(
                  width: 2,
                ),
                massConverter(),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(children: [
              areaConverter(),
              SizedBox(
                width: 2,
              ),
              temperatureConverter(),
            ]),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                timeConverter(),
                SizedBox(
                  width: 2,
                ),
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.orange[50],
        child: Column(
          children: [
            SizedBox(height: 100.0),
            Text(
              "Created By",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 20.00,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.00,
            ),
            CircleAvatar(
              foregroundImage: AssetImage(
                "asets/photo.jpg",
              ),
              minRadius: 40,
              maxRadius: 60,
            ),
            Text("Ayush Kumar Singh",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.00,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10.00,
            ),
            Text("Roll.No-102103249",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 15.00,
                    fontWeight: FontWeight.bold)),
            Text("EmailID-asingh22_be21@thapar.edu",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 15.00,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30.00,
            ),
          ],
        ),
      ),
    );
  }
}
