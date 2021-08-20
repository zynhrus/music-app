import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:music_player/model/song.dart';

class DioService {
  final Dio _dio = Dio();


  final _baseUrl = 'http://itunes.apple.com';
  final _attribute = 'allArtistTerm';
  final _entity = 'song';

  Future<dynamic> getSongs(String artist) async {
    var songData;

    try {
      Response response = await _dio.get(_baseUrl + '/search?term=$artist&entity=$_entity&attribute=$_attribute');
      if (response.statusCode == 200) {
        var getJson = json.decode((response.data));

        songData = (getJson['results'] as List)
            .map((song) => Song.fromJson(song))
            .toList();
      } else {
        print("ERROR KARENA STATUS");
        print("Status Code : ${response.statusCode}");
      }
    } on DioError catch (e){
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
    return songData;
  }
}