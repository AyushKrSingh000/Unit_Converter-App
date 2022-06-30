// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, sort_child_properties_last, avoid_print, camel_case_types

import 'package:flutter/material.dart';

class timeCalc extends StatefulWidget {
  @override
  _timeCalcState createState() => _timeCalcState();
}

class _timeCalcState extends State<timeCalc> {
  final TextStyle labelStyle =
      TextStyle(fontSize: 22.0, color: Colors.orangeAccent);
  final TextStyle resultSyle = TextStyle(
    color: Colors.orangeAccent,
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
  );

  final List<String> _mesaures = [
    'Year',
    'Week',
    'Day',
    'Hour',
    'Minute',
    'Second',
    'Millisecond',
    'Microsecond',
    'Picosecond',
  ];

  late double? _value = 0;
  static String fromMesaures = 'Year';
  static String toMesaures = 'Week';
  static String results = "";

  final Map<String, int> mesauresMap = {
    'Year': 0,
    'Week': 1,
    'Day': 2,
    'Hour': 3,
    'Minute': 4,
    'Second': 5,
    'Millisecond': 6,
    'Microsecond': 7,
    'Picosecond': 8,
  };
  dynamic _formulas = {
    '0': [
      1,
      52.1428571,
      365,
      8760,
      525600,
      31536000,
      31536000000,
      31536000000000,
      31536000000000
    ],
    '1': [
      0.0191780822,
      1,
      7,
      168,
      10080,
      604800,
      604800000,
      604800000000,
      604800000000000000
    ],
    '2': [
      0.00273972603,
      0.142857143,
      1,
      24,
      1440,
      86400,
      86400000,
      86400000000,
      86400000000000000
    ],
    '3': [
      0.000114155251,
      0.00595238095,
      0.0416666667,
      1,
      60,
      3600,
      3600000,
      3600000000,
      3600000000000000
    ],
    '4': [
      0.00000190258752,
      0.0000992063492,
      0.000694444444,
      0.0166666667,
      1,
      60,
      60000,
      60000000,
      60000000000000
    ],
    '5': [
      0.000000031709792,
      0.00000165343915,
      0.0000115740741,
      0.000277777778,
      0.01666666667,
      1,
      1000,
      1000000,
      1000000000000
    ],
    '6': [
      0.000000000031709792,
      0.00000000165343915,
      0.0000000115740741,
      0.000000277777778,
      0.00001666666667,
      0.001,
      1,
      1000,
      1000000000
    ],
    '7': [
      0.000000000000031709792,
      0.00000000000165343915,
      0.0000000000115740741,
      0.000000000277777778,
      0.00000001666666667,
      0.000001,
      0.001,
      1,
      1000000
    ],
    '8': [
      0.000000000000000000031709792,
      0.00000000000000000165343915,
      0.0000000000000000115740741,
      0.000000000000000277777778,
      0.00000000000001666666667,
      0.000000000001,
      0.000000001,
      0.000001,
      1
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.orange[100],
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              title: Center(
                  child: Text(
                "Time Converter",
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
              shadowColor: Colors.orangeAccent,
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
                                              width: 20.00,
                                            ),
                                            Text(
                                              value,
                                              style: TextStyle(fontSize: 20.00),
                                            ),
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
                                              width: 5,
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
                      color: Colors.orangeAccent,
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
        if (from == 0 && to == 8) {
          results =
              "$_value $fromMesaures = ${(_value!.toInt()) * multiplier}000000 $toMesaures";
        } else {
          results =
              "$_value $fromMesaures = ${_value! * multiplier} $toMesaures";
        }
      });
    } else {
      setState(() {
        results = "Please enter a non zero value";
      });
    }
  }
}
