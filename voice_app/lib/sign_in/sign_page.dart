import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_app/home_page/home_page.dart';
import 'package:voice_app/sign_in/forgot_password_page.dart';
import 'package:voice_app/sign_in/sign_up_page.dart';
import 'package:voice_app/util/valiadation.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with ValidationData {
  final formKey = GlobalKey<FormState>();

  // double
  double padding = 24.0;

  // color
  Color _color = Color.fromRGBO(255, 98, 96, 1);
  Color _btnColor = Color.fromRGBO(81, 88, 99, 1);
  Color _btnColor1 = Colors.black;

  // bool show text in Password text
  bool showText = false;

  // ID, PW
  String _email = "aaa@aaa.aaa";
  String _password = "0101010101010";

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
                  child: Text(
                    "Welcome !",
                    style: GoogleFonts.poppins(
                      fontSize: 40.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 6.0,
                          blurRadius: 6.0,
                          offset: Offset(6.0, 6.0),
                        )
                      ],
                    ),
                  ),
                ),

                // image
                Container(
                  margin: EdgeInsets.only(top: padding * 2),
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
                              filter:
                                  ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Email
                        Container(
                          height: 50.0,
                          child: TextFormField(
                            initialValue: _email,  //;

                            keyboardType: TextInputType.emailAddress,
                            validator: validateEmail,
                            onSaved: (String value) {
                              _email = value;
                            },
                            style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            showCursor: true,
                            decoration: InputDecoration(
                              // out line
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
                              hintText: "Emails",
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 16.0,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),

                        // password added show/hide icon
                        Container(
                          height: 50.0,
                          child: TextFormField(
                            initialValue: _password,  //;

                            validator: validatePassword,
                            onSaved: (String value) {
                              _password = value;
                            },
                            style: GoogleFonts.poppins(
                              fontSize: showText ? 24.0 : 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            obscureText: showText,
                            showCursor: true,
                            decoration: InputDecoration(
                              // out line
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

                              // suffix icon
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showText = !showText;
                                  });
                                },
                                icon: Icon(
                                  showText
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                  size: 16.0,
                                  color: showText ? Colors.red : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // sign in && Next
                        Container(
                          height: 70.0,
                          child: Row(
                            children: <Widget>[
                              // text: Sign In
                              Text(
                                "Sign In",
                                style: GoogleFonts.poppins(
                                  fontSize: 28.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 6.0,
                                      blurRadius: 6.0,
                                      offset: Offset(6.0, 6.0),
                                    )
                                  ],
                                ),
                              ),

                              // spacer
                              Spacer(),

                              // Icon: arrow in circle container
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (formKey.currentState.validate()) {
                                      formKey.currentState.save();
                                      print("saving user account..");

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()));
                                    }
                                  });
                                },
                                child: Container(
                                  height: 70.0,
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [_btnColor, _btnColor1],
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      stops: [0.3, 1.0],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 1.0,
                                        blurRadius: 1.0,
                                        offset: Offset(1.0, 1.0),
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.longArrowAltRight,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // sign up && Forgot Passwords
                        Container(
                          height: 50.0,
                          child: Row(
                            children: <Widget>[
                              // sign up
                              GestureDetector(
                                onTap: () {
                                  print("on clicked: sign up");

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpPage()));
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50.0,
                                  width: 150.0,
                                  child: Text(
                                    "Sign up",
                                    style: GoogleFonts.poppins(
                                      decoration: TextDecoration.underline,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decorationColor: Colors.black,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 6.0,
                                          blurRadius: 6.0,
                                          offset: Offset(6.0, 6.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // spacer
                              Spacer(),

                              // forgot passwords
                              GestureDetector(
                                onTap: () {
                                  print("on clicked: Forgot Passwords");

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordsPage()));
                                },
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  height: 50.0,
                                  width: 150.0,
                                  child: Text(
                                    "Forgot Passwords",
                                    style: GoogleFonts.poppins(
                                      decoration: TextDecoration.underline,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decorationColor: Colors.black,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 6.0,
                                          blurRadius: 6.0,
                                          offset: Offset(6.0, 6.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
