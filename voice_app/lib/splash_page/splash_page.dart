import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voice_app/sign_in/sign_page.dart';
import 'package:voice_app/splash_page/splash_page_items.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // double
  double padding = 24.0;

  // page view index
  int _currentIndex = 0;

  // page view controller
  PageController _pageController;

  // int splash items count
  int itemsCount = splashItems.length - 1;

  // set bool seen
  setCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("seen", true);

    // move next page
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => SignInPage()));
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color
      backgroundColor: Colors.white,

      // main body
      body: Stack(
        children: <Widget>[
          // page view
          Positioned.fill(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,

              onPageChanged: (int currentIndex) {
                setState(() {
                  _currentIndex = currentIndex;
                });
              },

              itemCount: splashItems.length,
              // 4

              controller: _pageController,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    // color
                    color: splashItems[index].color,

                    // image
                    image: DecorationImage(
                      image: NetworkImage(
                        splashItems[index].image,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // text: title
                      Text(
                        splashItems[index].title,
                        style: GoogleFonts.poppins(
                          fontSize: 28.0,
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

                      // text: subTitle
                      Text(
                        splashItems[index].subTitle,
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
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
                    ],
                  ),
                );
              },
            ),
          ),

          // dots indicator
          Positioned(
            left: padding,
            right: padding,
            bottom: padding,
            height: 48.0,
            child: Row(
              children: <Widget>[
                // left: dots indicator
                DotsIndicator(
                  dotsCount: splashItems.length, // 4
                  position: _currentIndex.toDouble(),
                  decorator: DotsDecorator(
                    color: Colors.white,
                    activeColor: Colors.black,

//                    shape: StadiumBorder(),
//                    activeShape: StadiumBorder(),

//                    size: Size(16.0, 6.0),
//                    activeSize: Size(16.0, 6.0),
                  ),
                ),

                // spacer
                Spacer(),

                // right: text: Skip
                InkWell(
                  onTap: () {
                    setCounter();
                  },
                  child: Text(
                    _currentIndex == itemsCount? "Next" : "Skip",
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
