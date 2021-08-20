import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/model/song.dart';

AudioPlayer audioPlayer = AudioPlayer();

void playMusic(
    {required Song song, required bool isPlay, bool isResume = false}) async {
  if (isPlay) {
    if (isResume) {
      await audioPlayer.pause();
    } else {

      await audioPlayer.stop();
    }
  } else {
    if (isResume) {
      await audioPlayer.resume();
    } else {
      await audioPlayer.play(song.previewUrl);
    }
  }
}
