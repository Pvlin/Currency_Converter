import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String value = '0';
  String resultString = '';
  String currency = '--';

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
      backgroundColor: const Color(0xFF3E6C70),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Text('CURRENCY CONVERTER',
                      style: GoogleFonts.varelaRound(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  const SizedBox(height: 80),
                  Row(children: <Widget>[
                    Text('INSERT VALUE',
                        style: GoogleFonts.varelaRound(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ]),
                  TextField(
                      style: GoogleFonts.varelaRound(
                          fontSize: 40, fontWeight: FontWeight.bold),
                      cursorColor: Colors.black,
                      keyboardType: const TextInputType.numberWithOptions(),
                      //Klawiatura
                      onChanged: (input) {
                        //zmienia wyświetlany tekst na wpisany
                        setState(() {
                          value = input;
                        });
                      }),
                  Text('PLN',
                      style: GoogleFonts.varelaRound(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Text(resultString,
                          style: GoogleFonts.varelaRound(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Divider(color: Colors.black),
                  Text(currency,
                      style: GoogleFonts.varelaRound(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 50),
                  Row(children: <Widget>[
                    Text('        CHANGE CURRENCY ',
                        style: GoogleFonts.varelaRound(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    DropdownButton(
                      iconSize: 50,
                      iconDisabledColor: const Color(0xFF85E9F2),
                      iconEnabledColor: const Color(0xFF85E9F2),
                      dropdownColor: const Color(0xFF1C6970),
                      items: <String>['EUR', 'USD', 'CHF', 'GBP']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          currency = newValue!;
                        });
                      },
                    ),
                  ]),
                  const SizedBox(height: 25),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: const Color(0xFF006375),
                    onPressed: () {
                      getData();
                    },
                    child: Text(
                      'CALCULATE',
                      style: GoogleFonts.varelaRound(
                          fontSize: 30,
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
