import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class ConvertScreen extends StatefulWidget {
  const ConvertScreen({Key? key}) : super(key: key);

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  String value = '0';
  String resultString = '';
  String currency = '';

  void getData() async {
    if (value != '' && currency != '--') {
      Response response = await get(Uri.parse(
          'https://v6.exchangerate-api.com/v6/bdac4f51d606c9a68888a7e1/latest/PLN'));
      String data = response.body;
      var resultJ = jsonDecode(data);
      double selectedCountryValue = resultJ['conversion_rates'][currency];
      double userValue = double.parse(value);
      setState(() {
        double resultF = userValue * selectedCountryValue;
        resultString = resultF.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONVERT YOUR CURRENCY',
            style: GoogleFonts.varelaRound(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: Color(0xFF3E6C70),
      ),
      backgroundColor: const Color(0xFF3E6C70),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white),
                    child: Center(
                      child: Row(children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 10.0)),
                        Text('CHANGE CURRENCY ',
                            style: GoogleFonts.varelaRound(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        DropdownButton(
                          iconSize: 50,
                          iconDisabledColor: const Color(0xFF85E9F2),
                          iconEnabledColor: Colors.black,
                          // iconEnabledColor: const Color(0xFF85E9F2),
                          dropdownColor: Colors.white,
                          items: <String>['EUR', 'USD', 'CHF', 'GBP']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: GoogleFonts.varelaRound(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              currency = newValue!;
                            });
                          },
                        ),
                      ]),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 50.0)),
                  TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          labelText: 'Insert value in PLN'),
                      style: GoogleFonts.varelaRound(
                          fontSize: 25, fontWeight: FontWeight.bold),
                      cursorColor: Colors.black,
                      keyboardType: const TextInputType.numberWithOptions(),
                      //Klawiatura
                      maxLength: 10,
                      onChanged: (input) {
                        //zmienia wyświetlany tekst na wpisany
                        setState(() {
                          value = input;
                        });
                      }),
                  Padding(padding: EdgeInsets.only(top: 7.0)),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Row(
                    children: <Widget>[
                      Text('$currency',
                          style: GoogleFonts.varelaRound(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.only(right: 15.0)),
                      Text(
                        resultString,
                        style: GoogleFonts.varelaRound(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 65),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Color(0xFF3E6C70),
                    onPressed: () {
                      getData();
                    },
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'CALCULATE',
                      style: GoogleFonts.varelaRound(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
