import 'package:audio_service/audio_service.dart';
import 'package:bharat_radio/providers/audio_state_provider.dart';
import 'package:bharat_radio/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class GridContent extends StatelessWidget {
  GridContent({this.radio, this.height = 50, this.width = 50, this.color});
  final MediaItem radio;
  final double height, width;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final player = Provider.of<AudioStateProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          player.startOrPlay(radio);
        },
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: color != null ? color : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  radio.artUri,
                  height: height,
                  width: width,
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
                      content: radio.title,
                      color: Colors.black,
                      size: 18,
                    ),
                    CustomText(
                      content: 'Hindi',
                      color: Colors.black38,
                      size: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
