// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, sort_child_properties_last, avoid_print, camel_case_types

import 'package:flutter/material.dart';

class massCalc extends StatefulWidget {
  @override
  _massCalcState createState() => _massCalcState();
}

class _massCalcState extends State<massCalc> {
  final TextStyle labelStyle = TextStyle(
    color: Colors.deepPurple,
    fontSize: 22.0,
  );
  final TextStyle resultSyle = TextStyle(
    color: Colors.deepPurpleAccent,
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
  );

  final List<String> _mesaures = [
    'Gram',
    'Kilogram',
    'Tonne',
    'Milligram',
    'Quintal',
    'Pound',
    'Ounce',
    'Carat',
    'Grain',
  ];

  late double? _value = 0;
  static String fromMesaures = 'Gram';
  static String toMesaures = 'Kilogram';
  static String results = "";

  final Map<String, int> _mesauresMap = {
    'Gram': 0,
    'Kilogram': 1,
    'Tonne': 2,
    'Milligram': 3,
    'Quintal': 4,
    'Pound': 5,
    'Ounce': 6,
    'Carat': 7,
    'Grain': 8
  };

  dynamic _formulas = {
    '0': [
      1,
      0.001,
      0.000001,
      1000,
      0.00001,
      0.00220462262,
      0.0352739619,
      5,
      15.4323584
    ],
    '1': [
      1000,
      1,
      .001,
      1000000,
      0.01,
      2.20462262,
      35.2739619,
      5000,
      15432.3584
    ],
    '2': [
      1000000,
      1000,
      1,
      1000000000,
      10,
      2204.62262,
      35273.9619,
      5000000,
      15432358.4
    ],
    '3': [
      0.0001,
      0.000001,
      0.000000001,
      1,
      0.00000001,
      0.00000220462262,
      0.0000352739619,
      0.005,
      0.015432584
    ],
    '4': [
      1000000,
      100,
      0.1,
      100000000,
      1,
      220.462262,
      3527.39619,
      500000,
      1543235.84
    ],
    '5': [
      453.59237,
      0.45359237,
      0.00045359237,
      453592.37,
      0.0045359237,
      1,
      16,
      2267.96185,
      7000
    ],
    '6': [
      28.3495231,
      0.0283495231,
      0.0000283495231,
      28349.5231,
      0.000283495231,
      0.0625,
      1,
      141.747616,
      437.5
    ],
    '7': [
      0.2,
      0.0002,
      0.0000002,
      200,
      0.000002,
      0.000440924524,
      0.00705479239,
      1,
      3.08647167
    ],
    '8': [
      0.06479891,
      0.00006479891,
      0.00000006479891,
      64.79891,
      0.0000006479891,
      0.000142857143,
      0.00228571429,
      0.2399455,
      1
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurple[100],
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              // iconTheme: IconThemeData(color: Colors.white),
              title: Center(
                child: Text(
                  "Weight Converter",
                  style: TextStyle(
                    fontSize: 25.00,
                    fontWeight: FontWeight.bold,
                    // color: Colors.white),
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
                shadowColor: Colors.deepPurpleAccent,
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
                        color: Colors.deepPurpleAccent,
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
