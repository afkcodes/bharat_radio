import 'package:audio_service/audio_service.dart';
import 'package:bharat_radio/providers/audio_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_text.dart';

class RadioHolder extends StatelessWidget {
  RadioHolder(
      {this.radio,
        this.marginLeft,
        this.marginRight,
        this.height = 120,
        this.width = 120,
        this.radius,
        this.color,
        this.shape});
  final MediaItem radio;
  final double marginLeft, marginRight, height, width, radius;
  final Color color;
  final String shape;

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<AudioStateProvider>(context);
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        player.startOrPlay(radio);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: marginLeft, right: marginRight),
            decoration: BoxDecoration(
              color: color != null ? color : Colors.transparent,
              shape: shape == 'circle' ? BoxShape.circle : BoxShape.rectangle,
              border: Border.all(
                color: Colors.grey,
                width: 0.2,
              ),
              borderRadius:
              shape == 'circle' ? null : BorderRadius.circular(radius),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Image.network(
                radio.artUri,
                height: height,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            width: 110,
            child: CustomText(
              content: radio.title,
              color: Colors.black,
              size: 16,
            ),
          ),
//          TextBuilder(
//            content: '115k fav',
//            color: Colors.black54,
//            size: 14,
//          )
        ],
      ),
    );
  }
}
