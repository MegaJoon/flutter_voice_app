import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list pages
  List<Widget> pages = [];

  // bottom navigation bar index
  int _selectedIndex = 0;

  // double
  double padding = 16.0;

  // color
  Color _color = Color.fromRGBO(133, 135, 254, 1);

  @override
  Widget build(BuildContext context) {
    // set pages
    _setPages(context);

    return Scaffold(
      // set background color
      backgroundColor: Colors.grey[200],

      // main body
      body: pages[_selectedIndex],

      // bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 16.0,
        currentIndex: _selectedIndex,

        onTap: (selectedIndex) {
          setState(() {
            _selectedIndex = selectedIndex;
          });
        },

        showUnselectedLabels: false,
        showSelectedLabels: false,

        selectedIconTheme: IconThemeData(
          color: Colors.black,
          size: 32.0,
        ),

        unselectedIconTheme: IconThemeData(
          color: Colors.grey[500],
          size: 24.0,
        ),

        // bottom items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text(""),
          ),
        ],
      ),
    );
  }

  _setPages(BuildContext context) {
    // screen height
    final screenHeight = MediaQuery.of(context).size.height;

    pages = [
      // 1
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            // text: title
            Container(
              height: screenHeight * 0.25,
              child: Center(
                child: Text(
                  "Alarm",
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
            ),

            // icon, btn
            Container(
              height: 90.0,
              child: Column(
                children: <Widget>[
                  // icon: more
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        size: 24.0,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  // spacer
                  Spacer(),

                  // "add alarm" btn
                  GestureDetector(
                    onTap: (){
                      print("on clicked: add alarm");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: padding * 3),
                      height: 40.0,
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: _color,
                        shadows: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1.0,
                            blurRadius: 1.0,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // icon: add
                          Icon(
                            Icons.add,
                            size: 16.0,
                            color: Colors.white,
                          ),

                          // text: Add Alarm
                          Text(
                            "Add Alarm",
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              color: Colors.white,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // 2
      Center(
        child: Text(
          "Home Page",
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

      // 3
      Placeholder(),

      // 4
      Placeholder(),
    ];
  }
}
