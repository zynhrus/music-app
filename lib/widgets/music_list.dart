import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/Service/audio_service.dart';

import 'package:music_player/model/song.dart';

import 'package:music_player/cubit/song_cubit.dart';
import 'package:music_player/cubit/media_player_cubit.dart';
import 'package:music_player/cubit/play_cubit.dart';
import 'package:music_player/shared/theme.dart';

class MusicList extends StatefulWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongCubit, SongState>(
      builder: (context, songState) {
        if (songState is GetSongSuccess) {
          var songs = songState.songs;
          if (songs!.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              child: Center(
                child: Text(
                  "Please fill text search bar or try to enter other artist",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: bold),
                ),
              ),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  var song = songs[index];
                  bool isPlay = context.watch<PlayCubit>().isPlay(song);

                  return BlocBuilder<PlayCubit, Song>(
                    builder: (context, state) {
                      return musicItem(isPlay, context, song);
                    },
                  );
                },
              ),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  GestureDetector musicItem(bool isPlay, BuildContext context, Song song) {
    return GestureDetector(
      onTap: () async {
        if (!isPlay) {
          context.read<MediaPlayerCubit>().setShow(true);
        } else {
          context.read<MediaPlayerCubit>().setShow(false);
        }
        context.read<PlayCubit>().setSong(song);
        playMusic(song: song, isPlay: isPlay);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInImage.assetNetwork(
              width: 75,
              placeholder: 'assets/loading.gif',
              image: song.artworkUrl100,
              height: 75,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.trackName,
                    style: TextStyle(fontSize: 17, fontWeight: bold),
                  ),
                  Text(
                    song.artistName,
                    style: TextStyle(fontSize: 15, fontWeight: regular),
                  ),
                  Text(
                    song.collectionName,
                    style: TextStyle(fontSize: 14, fontWeight: light),
                  ),
                ],
              ),
            ),
            isPlay
                ? Container(
                    margin: EdgeInsets.only(left: 15, right: 12),
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/sound_play.gif"),
                  )
                : Container(
                    margin: EdgeInsets.only(left: 15, right: 12), width: 50)
          ],
        ),
      ),
    );
  }
}
