import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';

final playControl = MediaControl(
  androidIcon: 'drawable/ic_action_play_arrow',
  label: 'Play',
  action: MediaAction.play,
);
final pauseControl = MediaControl(
  androidIcon: 'drawable/ic_action_pause',
  label: 'Pause',
  action: MediaAction.pause,
);
final stopControl = MediaControl(
  androidIcon: 'drawable/ic_action_stop',
  label: 'Skip Previous',
  action: MediaAction.stop,
);

class PlayerBackGroundTask extends BackgroundAudioTask {
  final AudioPlayer _audioPlayer = AudioPlayer();
  AudioSession _session;
  StreamSubscription playerEventSubscription;

// Initialise your audio task.
  @override
  Future<void> onStart(Map<String, dynamic> params) async {
    print("Coming inside onStart");
    _session = await AudioSession.instance;
    await _session.configure(AudioSessionConfiguration.music());
    playerEventSubscription = _audioPlayer.playbackEventStream.listen((event) {
      switch (event.processingState) {
        case ProcessingState.ready:
          _setState(state: AudioProcessingState.ready);
          break;
        case ProcessingState.buffering:
          _setState(state: AudioProcessingState.buffering);
          break;
        case ProcessingState.completed:
          break;
        default:
          break;
      }
    });
  }

  @override
  Future<void> onPlay() async {
  try{
    await _audioPlayer.play();
    _setState(state: AudioProcessingState.ready);
  }
  catch(e){
    _audioPlayer.stop();
    AudioService.disconnect();
    _setState(state: AudioProcessingState.error);
  }
  }

  @override
  Future<void> onPlayMediaItem(MediaItem radioItem) async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.setUrl(radioItem.extras['source']);
      await onUpdateMediaItem(radioItem);
      _audioPlayer.play();
      _setState(state: AudioProcessingState.ready);
    } catch (e) {
      _setState(state: AudioProcessingState.error);
    }

  }

  @override
  Future<void> onUpdateMediaItem(MediaItem mediaItem) async {
    AudioServiceBackground.setMediaItem(mediaItem);
  }

  @override
  Future<void> onPause() async {
    print(_audioPlayer.playing);
    _audioPlayer.pause();
    _setState(state: AudioServiceBackground.state.processingState);
  }

  @override
  Future<void> onStop() async {
    // Stop playing audio
    await _audioPlayer.stop();
    playerEventSubscription.cancel();
    await _audioPlayer.dispose();
    await AudioServiceBackground.setState(
      controls: [],
      processingState: AudioProcessingState.none,
      playing: false,
    );
    await super.onStop();
  }

  void _setState({AudioProcessingState state}) {
    AudioServiceBackground.setState(
      controls: getControls(),
      processingState: state,
      playing: _audioPlayer.playing,
    );
  }

  List<MediaControl> getControls() {
    return [_audioPlayer.playing ? pauseControl : playControl, stopControl];
  }
}