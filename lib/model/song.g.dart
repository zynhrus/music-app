// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song(
    trackId: json['trackId'] as int,
    artistName: json['artistName'] as String,
    collectionName: json['collectionName'] as String,
    trackName: json['trackName'] as String,
    previewUrl: json['previewUrl'] as String,
    artworkUrl100: json['artworkUrl100'] as String,
  );
}

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'trackId': instance.trackId,
      'artistName': instance.artistName,
      'collectionName': instance.collectionName,
      'trackName': instance.trackName,
      'previewUrl': instance.previewUrl,
      'artworkUrl100': instance.artworkUrl100,
    };
