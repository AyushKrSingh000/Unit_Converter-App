// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, sort_child_properties_last, avoid_print, camel_case_types

import 'package:flutter/material.dart';

class lengthCalc extends StatefulWidget {
  @override
  _lengthCalcState createState() => _lengthCalcState();
}

class _lengthCalcState extends State<lengthCalc> {
  final TextStyle labelStyle =
      TextStyle(fontSize: 22.0, color: Colors.redAccent);
  final TextStyle resultSyle = TextStyle(
    color: Colors.redAccent,
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
  );

  final List<String> _mesaures = [
    'Meters',
    'Kilometers',
    'Centimeter',
    'Feet',
    'Miles',
    'Decimeter',
    'Millimeter',
    'Nanometer',
    'Picometer',
    'Inch',
    'Yard',
  ];

  late double? _value = 0;
  static String fromMesaures = 'Meters';
  static String toMesaures = 'Kilometers';
  static String results = "";

  final Map<String, int> mesauresMap = {
    'Meters': 0,
    'Kilometers': 1,
    'Centimeter': 2,
    'Feet': 3,
    'Miles': 4,
    'Decimeter': 5,
    'Millimeter': 6,
    'Nanometer': 7,
    'Picometer': 8,
    'Inch': 9,
    'Yard': 10
  };

  dynamic _formulas = {
    '0': [
      1,
      0.001,
      100,
      3.28084,
      0.000621371,
      10,
      1000,
      1000000000,
      1000000000000,
      39.3701,
      1.09361
    ],
    '1': [
      1000,
      1,
      100000,
      3280.84,
      0.621371,
      10000,
      1000000,
      1000000000000,
      1000000000000000,
      39370.1,
      1093.31
    ],
    '2': [
      0.01,
      0.00001,
      1,
      0.0328084,
      .0000062137,
      0.1,
      10,
      10000000,
      10000000000,
      .393701,
      0.0109361
    ],
    '3': [
      0.3084,
      0.0003048,
      30.48,
      1,
      0.000189394,
      3.048,
      304.8,
      304800000,
      304800000000,
      12,
      0.3333333
    ],
    '4': [
      1609.34,
      1.60934,
      160934.4,
      5280,
      1,
      16093.44,
      16094344,
      1609344000000,
      1609344000000000,
      63360,
      1760
    ],
    '5': [
      .1,
      0.0001,
      10,
      0.32808399,
      0.0000621371192,
      1,
      100,
      100000000,
      100000000000,
      3.93700787,
      0.10936133
    ],
    '6': [
      0.001,
      0.000001,
      .1,
      0.0032808399,
      0.000000621371192,
      0.01,
      1,
      1000000,
      1000000000,
      .0393700787,
      0.0010936133
    ],
    '7': [
      0.000000001,
      0.000000000001,
      0.0000001,
      0.0000000032808399,
      0.000000000000621371192,
      0.00000001,
      0.000001,
      1,
      1000,
      0.0000000393700787,
      .0000000010936133
    ],
    '8': [
      0.000000000001,
      0.000000000000001,
      0.0000000001,
      0.0000000000032808399,
      0.000000000000000621371192,
      0.00000000001,
      0.000000001,
      0.0001,
      1,
      0.0000000000393700787,
      0.0000000000010936133
    ],
    '9': [
      0.0254,
      0.0000254,
      2.54,
      0.083333333333,
      0.0000157828283,
      0.254,
      25.4,
      25400000,
      25400000000,
      1,
      0.0277777778
    ],
    '10': [
      .9144,
      0.0009144,
      91.44,
      3,
      0.000568181818,
      9.14,
      914.4,
      914400000,
      914400000000,
      36,
      1
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red[100],
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              title: Center(
                  child: Text(
                "Length Converter",
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
              shadowColor: Colors.redAccent,
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
                          borderSide: BorderSide(color: Colors.red),
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
                      color: Colors.redAccent,
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

      var multiplier = _formulas[from.toString()][to];

      setState(() {
        results = "$_value $fromMesaures = ${_value! * multiplier} $toMesaures";
      });
    } else {
      setState(() {
        results = "Please enter a non zero value";
      });
    }
  }
}
