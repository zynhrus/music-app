part of 'song_cubit.dart';

abstract class SongState extends Equatable {
  const SongState();

  @override
  List<Object?> get props => [];
}

class SongInitial extends SongState {

}

class SongLoading extends SongState {}

class GetSongSuccess extends SongState {
  final List<Song>? songs;

  GetSongSuccess(this.songs);

  @override
  List<Object?> get props => [songs];
}

class GetSongFailed extends SongState {
  final String error;

  GetSongFailed(this.error);

  @override
  List<Object?> get props => [error];
}