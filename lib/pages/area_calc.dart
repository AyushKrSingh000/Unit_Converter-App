// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, sort_child_properties_last, avoid_print, camel_case_types

import 'package:flutter/material.dart';

class areaCalc extends StatefulWidget {
  @override
  _areaCalcState createState() => _areaCalcState();
}

class _areaCalcState extends State<areaCalc> {
  final TextStyle labelStyle = TextStyle(
    color: Colors.green,
    fontSize: 22.0,
  );
  final TextStyle resultSyle = TextStyle(
    color: Colors.green,
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
  );

  final List<String> _mesaures = [
    'm\u00B2',
    'km\u00B2',
    'cm\u00B2',
    'mm\u00B2',
    'um\u00B2',
    'dm\u00B2',
    'Acre ac',
    'Are a',
    'mile\u00B2',
    'Yard yd\u00B2',
    'ft\u00B2',
    'in\u00B2',
  ];

  late double? _value = 0;
  static String fromMesaures = 'm\u00B2';
  static String toMesaures = 'km\u00B2';
  static String results = "";

  final Map<String, int> _mesauresMap = {
    'm\u00B2': 0,
    'km\u00B2': 1,
    'cm\u00B2': 2,
    'mm\u00B2': 3,
    'um\u00B2': 4,
    'dm\u00B2': 5,
    'Acre ac': 6,
    'Are a': 7,
    'mile\u00B2': 8,
    'Yard yd\u00B2': 9,
    'ft\u00B2': 10,
    'in\u00B2': 11,
  };

  dynamic _formulas = {
    '0': [
      1,
      0.000001,
      10000,
      1000000,
      1000000000000,
      100,
      0.000247105407,
      0.010,
      0.000000386102159,
      1.19599005,
      10.7639104,
      1550.0031
    ],
    '1': [
      1000000,
      1,
      10000000000,
      1000000000000,
      1000000000000000000,
      100000000,
      247.105407,
      10000,
      0.386102159,
      1195990.05,
      10763910.4,
      1550003100
    ],
    '2': [
      0.0001,
      0.0000000001,
      1,
      100,
      100000000,
      0.01,
      0.0000000247105407,
      0.0000010,
      0.0000000000386102159,
      0.000119599005,
      0.00107639104,
      0.15500031
    ],
    '3': [
      0.000001,
      0.000000000001,
      0.01,
      1,
      1000000,
      0.0001,
      0.000000000247105407,
      0.000000010,
      0.000000000000386102159,
      0.00000119599005,
      0.0000107639104,
      0.0015500031
    ],
    '4': [
      0.000000000001,
      0.000000000000000001,
      0.00000001,
      0.000001,
      1,
      0.0000000001,
      0.000000000000000247105407,
      0.000000000000010,
      0.000000000000000000386102159,
      0.00000000000119599005,
      0.0000000000107639104,
      0.0000000015500031
    ],
    '5': [
      0.01,
      0.00000001,
      100,
      10000,
      10000000000,
      1,
      0.00000247105407,
      0.00010,
      0.00000000386102159,
      0.0119599005,
      0.107639104,
      15.500031
    ],
    '6': [
      4046.856,
      0.004046856,
      40468560,
      4046856000,
      4046856000000000,
      404685.6,
      1,
      40.46856,
      0.00156249984,
      4839.99949,
      43599.9955,
      62272639.35
    ],
    '7': [
      100,
      0.0001,
      1000000,
      100000000,
      100000000000000,
      10000,
      0.0247105407,
      1,
      0.0000386102159,
      119.599005,
      1076.39104,
      155000.31
    ],
    '8': [
      2589988.11,
      2.58998811,
      25899881100,
      2589988110000,
      2589988110000000000,
      258998811,
      640.000067,
      25899.8811,
      1,
      3097600,
      27878400,
      4014489600
    ],
    '9': [
      0.83612736,
      0.00000083612736,
      8361.2736,
      836127.36,
      836127360000,
      83.612736,
      0.000206611592,
      0.0083612736,
      0.00000032283057,
      1,
      9,
      1296
    ],
    '10': [
      0.09290304,
      0.00000009290304,
      929.0304,
      92903.04,
      9290304000,
      9.290304,
      0.0000229568435,
      0.0009290304,
      0.0000000358700643,
      0.11111112,
      1,
      144
    ],
    '11': [
      0.00064516,
      0.00000000064516,
      6.4516,
      645.16,
      645160000,
      0.064516,
      0.000000159422525,
      0.0000064516,
      0.000000000249097669,
      0.000771604938,
      0.006944444445,
      1
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green[100],
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              // iconTheme: IconThemeData(color: Colors.white),
              title: Center(
                child: Text(
                  "Area Converter",
                  style: TextStyle(
                    fontSize: 25.00,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80.00,
            ),
            Center(
              child: Card(
                elevation: 20,
                shadowColor: Colors.greenAccent,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter the Value',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        // keyboardAppearance: ,
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              _value = 0;
                            } else {
                              _value = double.tryParse(value);
                            }
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
                                              Text(
                                                value,
                                                style:
                                                    TextStyle(fontSize: 20.00),
                                              ),
                                            ],
                                          ),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    fromMesaures = value.toString();
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
                                              SizedBox(
                                                width: 20.00,
                                              ),
                                              Text(value,
                                                  style: TextStyle(
                                                      fontSize: 20.00)),
                                              SizedBox(
                                                width: 20.00,
                                              ),
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
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.00),
                        ),
                        color: Colors.green,
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
            ),
          ],
        ),
      ),
    );
  }

  void _convert() {
    if (_value != 0 && fromMesaures.isNotEmpty && toMesaures.isNotEmpty) {
      int? from = _mesauresMap[fromMesaures];
      int? to = _mesauresMap[toMesaures];

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
