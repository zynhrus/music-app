import 'package:flutter/material.dart';
import 'package:music_player/Service/audio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/cubit/last_play_cubit.dart';
import 'package:music_player/cubit/media_player_cubit.dart';
import 'package:music_player/cubit/play_cubit.dart';
import 'package:music_player/model/song.dart';
import 'package:music_player/shared/theme.dart';

class MediaPlayer extends StatefulWidget {
  const MediaPlayer({
    Key? key,
  }) : super(key: key);

  @override
  _MediaPlayerState createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<MediaPlayer> {
  double currentSliderValue = 40;
  Duration duration = Duration( seconds: 1);
  Duration position = Duration(seconds: 0);

  @override
  Widget build(BuildContext context) {
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });

    return BlocBuilder<MediaPlayerCubit, bool>(
      builder: (context, hideState) {
        return BlocBuilder<PlayCubit, Song>(
          builder: (context, state) {
            var song = state;
            bool isPlay = context.watch<PlayCubit>().isPlay(state);

            if (song.trackName == "" && hideState == false) {
              return SizedBox();
            } else {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: kWhiteColor.withOpacity(0.97),
                    boxShadow: [
                      BoxShadow(
                        color: kGreyColor.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 100,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.skip_previous,
                            size: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: BlocBuilder<LastPlayCubit, Song>(
                              builder: (context, lastPlayState) {
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<MediaPlayerCubit>()
                                        .setShow(true);

                                    if (song.trackName == "") {
                                      context
                                          .read<PlayCubit>()
                                          .setSong(lastPlayState);
                                      playMusic(
                                          song: lastPlayState,
                                          isPlay: !isPlay,
                                          isResume: true);
                                    } else {
                                      context
                                          .read<LastPlayCubit>()
                                          .saveLastPlayed(song);
                                      context.read<PlayCubit>().setSong(song);
                                      playMusic(
                                          song: song,
                                          isPlay: isPlay,
                                          isResume: true);
                                    }
                                  },
                                  child: song.trackName == ""
                                      ? Icon(
                                    Icons.play_arrow,
                                    size: 40,
                                  )
                                      : Icon(
                                    Icons.pause,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),
                          Icon(
                            Icons.skip_next,
                            size: 40,
                          ),
                        ],
                      ),
                      Slider.adaptive(
                        activeColor: kPrimaryColor,
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}