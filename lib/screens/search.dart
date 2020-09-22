import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Search Stations',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 35,
                      ),
                    ),
                    TextField(
                      autofocus: true,
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
                        print('Tapped search');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
