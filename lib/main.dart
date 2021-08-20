import 'package:flutter/material.dart';
import 'package:music_player/Service/dio_service.dart';
import 'package:music_player/cubit/last_play_cubit.dart';
import 'package:music_player/cubit/media_player_cubit.dart';
import 'package:music_player/cubit/play_cubit.dart';
import 'package:music_player/cubit/song_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SongCubit(DioService()),
        ),
        BlocProvider(
          create: (context) => PlayCubit(),
        ),
        BlocProvider(
          create: (context) => LastPlayCubit(),
        ),
        BlocProvider(
          create: (context) => MediaPlayerCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Music App',
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}