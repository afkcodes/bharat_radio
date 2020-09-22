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
  Map _lastPlayed = Map();
  final storage = Storage();
  MediaItem _nowPlaying;

  AudioProcessingState get audioState => _audioState;
  bool get playerRunning => _playerRunning;
  bool get buffering => _audioState != AudioProcessingState.ready;
  String _remoteErrorMessage;
  bool get playing => _playing;
  MediaItem get nowPlaying => _nowPlaying;

  Future<void> startOrPlay(MediaItem radio) async {
    if (!AudioService.connected) {
      await AudioService.connect();
    }
    _nowPlaying = radio;
    notifyListeners();
    if (AudioService.running) {
      print('Coming to If startOrPlay ');
      AudioService.playMediaItem(radio);
      await _getLastPlayed();
      await setLastPlayed(radio);
    } else {
      print(' Coming to AudioService.running  else cond');
      AudioService.start(
        backgroundTaskEntrypoint: _audioPlayerTaskEntryPoint,
        androidNotificationChannelName: 'rbPlayback',
        androidStopForegroundOnPause: false,
      );
      AudioService.playMediaItem(radio);
      await setLastPlayed(radio);
    }

    AudioService.playbackStateStream
        .distinct()
        .where((event) => event != null)
        .listen((event) async {
      _audioState = event.processingState;
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

  Future<void> setLastPlayed(radio) async {
    _lastPlayed['id'] = radio.id ?? 0;
    _lastPlayed['title'] = radio.title ?? '';
    _lastPlayed['album'] = radio.album ?? '';
    _lastPlayed['artUri'] = radio.artUri ?? '';
    _lastPlayed['source'] = radio.extras['source'] ?? '';
    _lastPlayed['favCount'] = radio.extras['favCount'] ?? '';
    await storage.setMap('last_played', _lastPlayed);
  }

  Future<void> _getLastPlayed() async {
    _lastPlayed = await storage.getMap('last_played');
    print('------------------> $_lastPlayed');
  }

  playOrPause(){
    if(playing){
      AudioService.pause();
      _playing= false;
      notifyListeners();
    }else{
      try{
        AudioService.play();
        _playing=true;
        notifyListeners();
      }
      catch(e){
        print(e);
      }
    }
  }

  @override
  void dispose() async {
    await AudioService.disconnect();
    super.dispose();
  }
}
