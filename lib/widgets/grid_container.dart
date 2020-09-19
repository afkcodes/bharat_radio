import 'package:bharat_radio/models/radio.dart';
import 'package:bharat_radio/utils/constants.dart';
import 'package:bharat_radio/widgets/grid_content.dart';
import 'package:flutter/material.dart';
import 'package:bharat_radio/widgets/header.dart';

class BuildGridContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Header(
          primaryHeading: 'Trending Stations ',
          secondaryHeading: 'See All',
          onPress: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Favourite()));
          },
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 220,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            childAspectRatio: 1 / 3.2,
            crossAxisCount: 3,
            children: List.generate(radios.length, (index) {
              return GridContent(
                radio: radios[index],
                height: 60,
                width: 60,
                color: kContainerColor,
              );
            }),
          ),
        ),
      ],
    );
  }
}
