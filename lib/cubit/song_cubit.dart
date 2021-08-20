import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_player/Service/dio_service.dart';
import 'package:music_player/model/song.dart';

part 'song_state.dart';

class SongCubit extends Cubit<SongState> {
  final DioService dioService;

  SongCubit(this.dioService) : super(SongInitial());

  void getAllSongs({String artistName = ""}) async {
    try {
      emit(SongLoading());
      var songs = await dioService.getSongs(artistName);
      emit(GetSongSuccess(songs));
    } catch (e) {
      print(e);
      emit(GetSongFailed(e.toString()));
    }
  }
}
