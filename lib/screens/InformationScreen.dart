import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INFORMATION',
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 95,
                  backgroundImage: AssetImage("assets/Money.jpg"),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Text(
                  'INFORMATION',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.varelaRound(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Container(
                  child: Text(
                    'This application is used to check the current exchange rates. '
                    '\nThe data is taken from the website v6.exchangerate-api.com. '
                    '\n\nThe creator of this application is a novice programmer Pawel Sulkowski.',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.varelaRound(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
