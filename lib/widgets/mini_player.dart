import 'package:bharat_radio/providers/audio_state_provider.dart';
import 'package:bharat_radio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MiniPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final player = Provider.of<AudioStateProvider>(context);
    return Positioned(
      bottom: 20,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [kDefaultShadow],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                player.nowPlaying.artUri,
                height: 35,
                width: 35,
                fit: BoxFit.cover,
              ),
            ),
            IconButton(
              icon:
              player.playing ? Icon(Icons.pause) :Icon(Icons.play_arrow) ,
              iconSize: 45,
              color: Colors.white,
              onPressed: () {
                player.playOrPause();
              },
              padding: EdgeInsets.only(bottom: 0.5),
            ),
          ],
        ),
        height: 55,
        width: 120,
      ),
    );
  }
}