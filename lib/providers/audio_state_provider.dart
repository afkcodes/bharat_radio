import 'package:audio_service/audio_service.dart';
import 'package:bharat_radio/services/player_bg_task.dart';
import 'package:bharat_radio/utils/storage.dart';
import 'package:flutter/foundation.dart';

void _audioPlayerTaskEntryPoint() async {
  AudioServiceBackground.run(() => PlayerBackGroundTask());
}

class AudioStateProvider extends ChangeNotifier {
  AudioProcessingState _audioState = AudioProcessingState.none;
  bool _playing = false;
  bool _playerRunning = false;

  AudioProcessingState get audioState => _audioState;
  bool get playerRunning => _playerRunning;
  bool get buffering => _audioState != AudioProcessingState.ready;
  String _remoteErrorMessage;
  bool get playing => _playing;

  Future<void> startOrPlay(MediaItem radio) async {
    if (AudioService.running) {
      print('Coming to If startOrPlay ');
      AudioService.playMediaItem(radio);
    } else {
      print(' Coming to AudioService.running  else cond');
      AudioService.start(
        backgroundTaskEntrypoint: _audioPlayerTaskEntryPoint,
        androidNotificationChannelName: 'rbPlayback',
        androidStopForegroundOnPause: false,
      );
      AudioService.playMediaItem(radio);
    }

    AudioService.playbackStateStream
        .distinct()
        .where((event) => event != null)
        .listen((event) async {
      _audioState = event.processingState;
      print('_audioState -----------> $_audioState');
      _playing = event?.playing;

      /// Get error state.
      if (_audioState == AudioProcessingState.error) {
        _remoteErrorMessage = 'Network Error';
      }

      /// Reset error state.
      if (_audioState != AudioProcessingState.buffering) {
        _remoteErrorMessage = null;
      }
      _playerRunning = true;
      notifyListeners();
    });
  }

  @override
  void dispose() async {
    await AudioService.disconnect();
    super.dispose();
  }
}
