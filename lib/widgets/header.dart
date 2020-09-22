import 'package:bharat_radio/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({this.primaryHeading, this.secondaryHeading, this.onPress});
  final String primaryHeading;
  final String secondaryHeading;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomText(
            content: primaryHeading,
            size: 20,
            color: Colors.black,
            isBold: true,
          ),
          InkWell(
            onTap: onPress,
            splashColor: Colors.transparent,
            child: CustomText(
              content: secondaryHeading,
              size: 16,
              color: Color(0XFF6c7072),
            ),
          ),
        ],
      ),
    );
  }
}
