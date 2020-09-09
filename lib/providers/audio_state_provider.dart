import 'package:audio_service/audio_service.dart';
import 'package:bharat_radio/services/player_bg_task.dart';
import 'package:flutter/foundation.dart';

void _audioPlayerTaskEntryPoint() async {
  AudioServiceBackground.run(() => PlayerBackGroundTask());
}

class AudioStateProvider extends ChangeNotifier {
  MediaItem _lastPlayed;
  AudioProcessingState _audioState = AudioProcessingState.none;
  bool _playing = false;
  String _remoteErrorMessage;
  bool _playerRunning = false;

  AudioProcessingState get audioState => _audioState;
  bool get playerRunning => _playerRunning;
  bool get buffering => _audioState != AudioProcessingState.ready;
  MediaItem get lastPlayed => _getLastPlayed();

  Future<void> startOrPlay(MediaItem radio) async {
    if (AudioService.running) {
      AudioService.playMediaItem(radio);
    } else {
      print(' Coming to AudioService.running  else cond');
      AudioService.start(
        backgroundTaskEntrypoint: _audioPlayerTaskEntryPoint,
        androidNotificationChannelName: 'rbPlayback',
      );
      AudioService.playMediaItem(radio);
    }
    AudioService.playbackStateStream.listen((event) async {
      _audioState = event.processingState;
      print(" -----------------> $_audioState");
      _playing = event?.playing;

      /// Get error state.
      if (_audioState == AudioProcessingState.error) {
        _remoteErrorMessage = 'Network Error';
      }

      /// Reset error state.
      if (_audioState != AudioProcessingState.error) {
        _remoteErrorMessage = null;
      }
      notifyListeners();
    });
  }

  play() {
    AudioService.play();
  }

  pause() {
    AudioService.pause();
  }

  stop() {
    AudioService.stop();
  }

  _getLastPlayed() {}

  @override
  void dispose() async {
    // await AudioService.stop();
    await AudioService.disconnect();
    //_playerRunning = false;
    super.dispose();
  }
}
