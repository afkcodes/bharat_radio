import 'package:audio_service/audio_service.dart';
import 'package:bharat_radio/widgets/grid_container.dart';
import 'package:bharat_radio/widgets/horizontal_list.dart';
import 'package:bharat_radio/widgets/mini_player.dart';
import 'package:bharat_radio/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenHeader(),
              BuildHorizontalRadioList(
                shape: 'rect',
                radius: 5.0,
              ),
              BuildGridContainer(),
              BuildHorizontalRadioList(
                shape: 'rect',
                radius: 5.0,
              ),
              // Text(player.playing.toString()),
            ],
          ),
        ),
        MiniPlayer(),
      ],
    );
  }
}
