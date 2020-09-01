import 'package:bharat_radio/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _tabOptions = <Widget>[
    ScreenHeader(),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Likes',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black45.withOpacity(.05),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 22,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                curve: Curves.easeOutExpo,
                duration: Duration(milliseconds: 500),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: AntDesign.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: AntDesign.search1,
                    text: 'Search',
                  ),
                  GButton(
                    icon: AntDesign.hearto,
                    text: 'Likes',
                  ),
                  GButton(
                    icon: AntDesign.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
