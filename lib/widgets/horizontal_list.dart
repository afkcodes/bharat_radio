import 'package:bharat_radio/models/radio.dart';
import 'package:bharat_radio/utils/constants.dart';
import 'package:bharat_radio/widgets/header.dart';
import 'package:bharat_radio/widgets/radio_holder.dart';
import 'package:flutter/material.dart';

class BuildHorizontalRadioList extends StatelessWidget {
  BuildHorizontalRadioList(
      {@required this.shape, this.radius});
  final String shape;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Header(
          primaryHeading: 'Radio by language',
          secondaryHeading: 'See All',
          onPress: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Favourite()));
          },
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 170,
//                        color: Colors.deepPurple,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: radios.length,
            itemBuilder: (context, index) {
              bool last = radios.length == (index + 1);
              return RadioHolder(
                radio: radios[index],
                marginLeft: 10,
                height: 120,
                width: 120,
                radius: radius != null ? radius : null,
                marginRight: last ? 10 : 0,
                shape: shape,
                color: kContainerColor,
              );
            },
          ),
        ),
      ],
    );
  }
}
