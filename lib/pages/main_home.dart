// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static bool onChanged = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 40.00,
          ),
          Image.asset("asets/welcome.png"),
          Text(
            "Unit Converter App",
            style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 40.00,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.00,
          ),
          Text(
            "Created By",
            style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 15.00,
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
          Text(
            "Ayush Kumar Singh",
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 20.00,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.00,
          ),
          Text(
            "Roll.No-102103249",
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 15.00,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "EmailID-asingh22_be21@thapar.edu",
            style: TextStyle(
                color: Colors.red,
                fontSize: 15.00,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30.00,
          ),
          Material(
            borderRadius: onChanged
                ? BorderRadius.circular(50)
                : BorderRadius.circular(8),
            color: Colors.green[400],
            child: InkWell(
              onTap: () async {
                setState(() {
                  onChanged = true;
                });
                await Future.delayed(Duration(seconds: 1));
                await Navigator.pushNamed(context, "/home");
                setState(() {
                  onChanged = false;
                });
              },
              child: AnimatedContainer(
                height: 50.00,
                width: onChanged ? 50 : 100.00,
                duration: Duration(seconds: 1),
                // color: Colors.orangeAccent,

                child: Icon(
                  onChanged ? Icons.done : Icons.home,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
