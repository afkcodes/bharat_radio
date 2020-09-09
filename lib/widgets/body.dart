import 'package:audio_service/audio_service.dart';
import 'package:bharat_radio/providers/audio_state_provider.dart';
import 'package:bharat_radio/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final player = Provider.of<AudioStateProvider>(context);
    MediaItem radio =   MediaItem(
        id:'3',
        title: 'Diverse FM',
        album: 'Bharat Radio',
        artUri: 'https://radiosindia.com/images/diversefmnew.jpg',
        extras: {'source':'https://a11.streamgb.com/proxy/radioxl?mp=/stream', 'favCount' :0}
    );
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenHeader(),
          InkWell(
            onTap: (){
              player.startOrPlay(radio);
              print(" -----------------> ${player.audioState}");
            },
            child: Container(
              height: 120,
              width: 120,
              color: Colors.teal,
            ),
          ),
          Text(player.audioState.toString()),
        ],
      ),
    );
  }
}
