import 'package:bharat_radio/utils/constants.dart';
import 'package:bharat_radio/widgets/raw_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'custom_text.dart';

class BuildFavouriteContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kContainerColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              'https://d3kle7qwymxpcy.cloudfront.net/images/broadcasts/45/53/120198/2/c175.png',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomText(
                  content: 'Radio Name ',
                  size: 18,
                  isBold: true,
                ),
                SizedBox(height: 6),
                CustomText(
                  content: 'Hindi',
                  color: Colors.black38,
                  size: 16,
                ),
              ],
            ),
          ),
          BuildRawButton(
            icon: AntDesign.close,
            onPress: () {
              print('un liked');
            },
            size: 25,
            shape: 'circular',
            color:  Color(0XFF393e46),
          ),
          // SizedBox(
          //   width: 10,
          // ),
          // BuildRawButton(
          //   icon: FontAwesome.play,
          //   onPress: () {
          //     print('Played');
          //   },
          //   size: 30,
          //   shape: 'circular',
          //   color: Color(0XFF393e46),
          // )
        ],
      ),
    );
  }
}
