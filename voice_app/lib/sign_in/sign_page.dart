import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_app/home_page/home_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  // double
  double padding = 24.0;

  // color
  Color _color = Color.fromRGBO(255, 98, 96, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          top: true,
          left: true,
          right: true,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // text: Welcome
                Align(
                  alignment: Alignment.center,
                  child: Text("Welcome !",
                    style: GoogleFonts.poppins(
                      fontSize: 40.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      shadows: [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 6.0,
                        blurRadius: 6.0,
                        offset: Offset(6.0, 6.0),
                      )],
                    ),
                  ),
                ),

                // image
                Container(
                  margin: EdgeInsets.only(top: padding *2),
                  height: 200.0,
                  child: Stack(
                    children: <Widget>[
                      // circle container
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: padding,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _color,
                          ),
                        ),
                      ),

                      // bottom blur image
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        height: 100.0,
                        child: ClipRRect(
                          child: Container(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                              child: Container(
                                color: Colors.white.withOpacity(0.50),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // container
                Container(
                  height: 300.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Email
                      Container(
                        height: 50.0,
                        child: TextField(
//                      obscureText: true,
                          decoration: InputDecoration(
                            // when it clicked
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.teal,
                              ),
                            ),

                            // when it happens error
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.red,
                              ),
                            ),

                            // when initial
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.grey[300],
                              ),
                            ),

                            // hint
                            hintText: "Email",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 16.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),

                      // password
                      Container(
                        height: 50.0,
                        child: TextField(
//                      obscureText: true,
                          decoration: InputDecoration(
                            // when it clicked
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.teal,
                              ),
                            ),

                            // when it happens error
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.red,
                              ),
                            ),

                            // when initial
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.grey[300],
                              ),
                            ),

                            // hint
                            hintText: "Password",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 16.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),

                      // sign in && next
                      Container(
                        height: 70.0,
                        child: Placeholder(),
                      ),

                      // sign up && Forgot Passwords
                      Container(
                        height: 50.0,
                        child: Placeholder(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
