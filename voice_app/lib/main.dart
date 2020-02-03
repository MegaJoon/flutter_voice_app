import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voice_app/sign_in/sign_page.dart';
import 'package:voice_app/splash_page/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SeenPage(),
    );
  }
}

class SeenPage extends StatefulWidget {
  @override
  _SeenPageState createState() => _SeenPageState();
}

class _SeenPageState extends State<SeenPage> {
  getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bool seen = (prefs.getBool("seen") ?? false);
      print("seen = $seen");

      // seen == true? skip
      if(seen) {
        // if not first seen? view sign in page
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => SignInPage()));
      } else {
        // if first seen? view splash page
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => SplashPage()));
      }
    });
  }

  @override
  void initState() {
    // get bool
    getCounter();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
