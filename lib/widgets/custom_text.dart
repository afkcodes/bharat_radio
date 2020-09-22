import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    @required this.content,
    @required this.size,
    this.color,
    this.isBold = false,
  });
  final String content;
  final double size;
  final Color color;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      content.replaceAll("", "\u{200B}"),
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
