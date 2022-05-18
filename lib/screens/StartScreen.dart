import 'package:currency_converter/screens/ConvertScreen.dart';
import 'package:currency_converter/screens/InformationScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
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
                Padding(padding: EdgeInsets.only(top: 15.0)),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 75,
                  backgroundImage: AssetImage("assets/Money.jpg"),
                ),
                Padding(padding: EdgeInsets.only(top: 40.0)),
                Text(
                  'WELCOME',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.varelaRound(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  'TO THE NEW WORLD OF CURRENCIES!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.varelaRound(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(padding: EdgeInsets.only(top: 55.0)),
                Container(
                  child: TextButton(
                    child: Text(
                      'CALCULATE CURRENCY',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.varelaRound(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConvertScreen()));
                    },
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white,
                  ),
                  width: 500,
                  padding: EdgeInsets.all(20),
                  //margin: EdgeInsets.all(10),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Container(
                  child: TextButton(
                    child: Text(
                      'MORE ABOUT THE APP',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.varelaRound(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InformationScreen()));
                    },
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white,
                  ),
                  width: 500,
                  padding: EdgeInsets.all(20),
                  //margin: EdgeInsets.all(10),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
