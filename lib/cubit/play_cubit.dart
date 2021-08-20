import 'package:bloc/bloc.dart';
import 'package:music_player/model/song.dart';

class PlayCubit extends Cubit<Song> {
  PlayCubit() : super(Song());

  void setSong(Song song){
    if(isPlay(song)){
      emit(Song());
    } else {
      emit(song);
    }
  }

  bool isPlay(Song song) {
    return song == state;
  }
}
