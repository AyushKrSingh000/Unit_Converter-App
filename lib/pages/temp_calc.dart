// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, sort_child_properties_last, avoid_print, camel_case_types

import 'package:flutter/material.dart';

class tempCalc extends StatefulWidget {
  @override
  _tempCalcState createState() => _tempCalcState();
}

class _tempCalcState extends State<tempCalc> {
  final TextStyle labelStyle =
      TextStyle(fontSize: 22.0, color: Colors.lightBlue);
  final TextStyle resultSyle = TextStyle(
    color: Colors.lightBlueAccent,
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
  );

  final List<String> _mesaures = [
    'Celsius',
    'Fahrenheit',
    'Kelvin',
    'Rankine',
    'Reaumur',
  ];

  late double? _value = 0;
  static String fromMesaures = 'Celsius';
  static String toMesaures = 'Fahrenheit';
  static String results = "";

  final Map<String, int> mesauresMap = {
    'Celsius': 0,
    'Fahrenheit': 1,
    'Kelvin': 2,
    'Rankine': 3,
    'Reaumur': 4,
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue[100],
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              title: Center(
                  child: Text(
                "Temperature Converter",
                style: TextStyle(
                  fontSize: 25.00,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            SizedBox(
              height: 80.00,
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              elevation: 20,
              shadowColor: Colors.lightBlueAccent,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Enter the Value',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          // if (value != int) {
                          //   ErrorHint("Hello");
                          // } else {
                          if (value.isEmpty) {
                            _value = 0;
                          } else {
                            _value = double.tryParse(value);
                          }

                          // }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'From',
                              style: labelStyle,
                            ),
                            DropdownButton(
                              items: _mesaures
                                  .map((String value) =>
                                      DropdownMenuItem<String>(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 30.00,
                                            ),
                                            Text(value,
                                                style:
                                                    TextStyle(fontSize: 20.00)),
                                          ],
                                        ),
                                        value: value,
                                      ))
                                  .toList(),
                              iconSize: 15,
                              elevation: 16,
                              underline: Container(
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6.0)),
                                          side: BorderSide(
                                            width: 0.5,
                                            style: BorderStyle.solid,
                                          )))),
                              onChanged: (value) {
                                setState(() {
                                  fromMesaures = value.toString();
                                });
                              },
                              value: fromMesaures,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('To', style: labelStyle),
                            DropdownButton(
                              items: _mesaures
                                  .map((String value) =>
                                      DropdownMenuItem<String>(
                                        child: Row(
                                          children: [
                                            Text(value,
                                                style:
                                                    TextStyle(fontSize: 20.00)),
                                            SizedBox(
                                              width: 25,
                                            )
                                          ],
                                        ),
                                        value: value,
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  toMesaures = value.toString();
                                });
                              },
                              iconSize: 15,
                              elevation: 16,
                              underline: Container(
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6.0)),
                                          side: BorderSide(
                                            width: 0.5,
                                            style: BorderStyle.solid,
                                          )))),
                              value: toMesaures,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MaterialButton(
                      // focusColor: Colors.orangeAccent,
                      minWidth: double.infinity,
                      onPressed: _convert,
                      child: Text(
                        'Convert',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      results,
                      style: resultSyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _convert() {
    if (_value != 0 && fromMesaures.isNotEmpty && toMesaures.isNotEmpty) {
      int? from = mesauresMap[fromMesaures];

      int? to = mesauresMap[toMesaures];

      if (from == 0) {
        results = "$_value $fromMesaures = $_value $toMesaures";

        if (to == 1) {
          results =
              "$_value $fromMesaures = ${(_value! * (9 / 5)) + 32}$toMesaures";
        }
        if (to == 2) {
          results = "$_value $fromMesaures = ${(_value)! + 273.15}$toMesaures";
        }
        if (to == 3) {
          results =
              "$_value $fromMesaures = ${(_value! + 273.15) * (9 / 5)}$toMesaures";
        }
        if (to == 4) {
          results = "$_value $fromMesaures = ${(_value! * (4 / 5))}$toMesaures";
        }
      }
      if (from == 1) {
        if (to == 0) {
          results =
              "$_value $fromMesaures = ${(_value! - 32) * (5 / 9)}$toMesaures";
        }
        if (to == 1) {
          results = "$_value $fromMesaures = $_value $toMesaures";
        }
        if (to == 2) {
          results =
              "$_value $fromMesaures = ${(_value! + 459.67) * (5 / 9)}$toMesaures";
        }
        if (to == 3) {
          results = "$_value $fromMesaures = ${(_value! + 459.67)}$toMesaures";
        }
        if (to == 4) {
          results =
              "$_value $fromMesaures = ${(_value! - 32) * 4 / 9}$toMesaures";
        }
      }
      if (from == 2) {
        if (to == 0) {
          results = "$_value $fromMesaures = ${(_value! - 273.15)}$toMesaures";
        }
        if (to == 1) {
          results =
              "$_value $fromMesaures = ${(_value! * (9 / 5)) - 459.67} $toMesaures";
        }
        if (to == 2) {
          results = "$_value $fromMesaures = $_value $toMesaures";
        }
        if (to == 3) {
          results = "$_value $fromMesaures = ${(_value! * (9 / 5))}$toMesaures";
        }
        if (to == 4) {
          results =
              "$_value $fromMesaures = ${(_value! - 273.15) * 4 / 5}$toMesaures";
        }
      }

      if (from == 3) {
        if (to == 0) {
          results =
              "$_value $fromMesaures = ${(_value! - 491.67) * (5 / 9)}$toMesaures";
        }
        if (to == 1) {
          results = "$_value $fromMesaures = ${(_value! - 459.67)} $toMesaures";
        }
        if (to == 2) {
          results =
              "$_value $fromMesaures = ${(_value! * (5 / 9))} $toMesaures";
        }
        if (to == 3) {
          results = "$_value $fromMesaures = $_value $toMesaures";
        }
        if (to == 4) {
          results =
              "$_value $fromMesaures = ${(_value! - 491.67) * 4 / 9}$toMesaures";
        }
      }
      if (from == 4) {
        if (to == 0) {
          results = "$_value $fromMesaures = ${(_value! * (5 / 4))}$toMesaures";
        }
        if (to == 1) {
          results =
              "$_value $fromMesaures = ${(_value! * (9 / 4) + 32)} $toMesaures";
        }
        if (to == 2) {
          results =
              "$_value $fromMesaures = ${(_value! * (5 / 4)) + 273.15} $toMesaures";
        }
        if (to == 3) {
          results =
              "$_value $fromMesaures = ${(_value! * (9 / 4)) + 491.67} $toMesaures";
        }
        if (to == 4) {
          results = "$_value $fromMesaures = $_value $toMesaures";
        }
      }

      setState(() {
        results;
      });
    } else {
      setState(() {
        results = "Please enter a non zero value";
      });
    }
  }
}
