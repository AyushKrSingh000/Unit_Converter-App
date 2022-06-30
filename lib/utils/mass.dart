// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_constructors_in_immutables, camel_case_types

import 'package:flutter/material.dart';

class massConverter extends StatefulWidget {
  massConverter({Key? key}) : super(key: key);

  @override
  State<massConverter> createState() => _massConverterState();
}

class _massConverterState extends State<massConverter> {
  bool onchanged = false;
  bool onchanged2 = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 2.0,
      shadowColor: Colors.orangeAccent,
      child: InkWell(
        onTap: () async {
          setState(() {
            onchanged2 = true;
          });
          await Future.delayed(Duration(milliseconds: 3));
          await Navigator.pushNamed(context, "/mass");
          setState(() {
            onchanged2 = false;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 3),
          width: 195.00,
          height: 180.00,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 60.00,
                ),
                Text(
                  onchanged2 ? "Opening..." : "Mass",
                  style: TextStyle(
                      fontSize: 20.00,
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  onchanged2 ? Icons.done : Icons.person,
                  size: 50.00,
                  color: Colors.deepPurpleAccent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
