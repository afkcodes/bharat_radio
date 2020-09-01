import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      style: TextStyle(
        decoration: TextDecoration.none,
      ),
      maxLines: 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0XFFF4F4F5),
        isDense: true,
        prefixIcon: Icon(
          Feather.search,
          size: 25,
          color: Colors.black87,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          borderSide: BorderSide.none,
        ),
        hintText: 'Find Your Favourite Stations',
      ),
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Search()));
      },
    );
  }
}
