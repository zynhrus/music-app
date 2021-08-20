import 'package:bloc/bloc.dart';
import 'package:music_player/model/song.dart';

class LastPlayCubit extends Cubit<Song> {
  LastPlayCubit() : super(Song());

  void saveLastPlayed(Song song){
    emit(song);
  }
}
