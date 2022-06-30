// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_constructors_in_immutables, camel_case_types

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class temperatureConverter extends StatefulWidget {
  temperatureConverter({Key? key}) : super(key: key);

  @override
  State<temperatureConverter> createState() => _temperatureConverterState();
}

class _temperatureConverterState extends State<temperatureConverter> {
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
              onchanged = false;
            });

            await Future.delayed(Duration(milliseconds: 3));
            await Navigator.pushNamed(context, "/temperature");
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
                    onchanged2 ? "Opening..." : "Temperature",
                    style: TextStyle(
                        fontSize: 20.00,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    onchanged2 ? Icons.done : Icons.fireplace,
                    size: 50.00,
                    color: Colors.lightBlueAccent,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
