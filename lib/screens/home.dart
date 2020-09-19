import 'package:bharat_radio/providers/audio_state_provider.dart';
import 'package:bharat_radio/screens/search.dart';
import 'package:bharat_radio/widgets/body.dart';
import 'package:bharat_radio/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

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
    Search(),
    Text(
      'Index 1: Search',
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
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider<AudioStateProvider>(
          create: (context) => AudioStateProvider(),
          child: SafeArea(child: Body()),
        ));
  }
}
