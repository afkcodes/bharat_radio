import 'package:flutter/material.dart';

class BuildRawButton extends StatelessWidget {
  BuildRawButton({
    @required this.onPress,
    @required this.icon,
    this.color,
    this.size = 45.0,
    this.shape,
  });
  final VoidCallback onPress;
  final IconData icon;
  final Color color;
  final double size;
  final String shape;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
      onPressed: onPress,
      elevation: 0.0,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      highlightElevation: 0.0,
      disabledElevation: 0.0,
      shape: shape == 'circular'
          ? CircleBorder()
          : RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
        ),
      ),
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
//      fillColor:
//          color == null ? kPrimaryColor : color, // Change This afterwards
    );
  }
}
