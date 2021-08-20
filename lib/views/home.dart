import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:music_player/shared/theme.dart';

import 'package:music_player/widgets/media_player.dart';


import 'package:music_player/cubit/song_cubit.dart';
import 'package:music_player/widgets/music_list.dart';
import 'package:music_player/widgets/search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<SongCubit>().getAllSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Column(
              children: [
                SearchBar(),
                MusicList(),
              ],
            ),
            MediaPlayer()
          ],
        ),
      ),
    );
  }
}


