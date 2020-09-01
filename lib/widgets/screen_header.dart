import 'package:bharat_radio/widgets/screen_heading_text.dart';
import 'package:bharat_radio/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
      height: 160,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ScreenHeadingText(),
          SearchBar(),
        ],
      ),
    );
  }
}
