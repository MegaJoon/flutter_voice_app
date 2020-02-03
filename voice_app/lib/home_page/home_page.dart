import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: Text("Home Page",
            style: GoogleFonts.poppins(
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [BoxShadow(
                color: Colors.white12,
                spreadRadius: 6.0,
                blurRadius: 6.0,
                offset: Offset(6.0, 6.0),
              )],
            ),
          ),
        ),
      ),
    );
  }
}
