import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'song.g.dart';

@JsonSerializable()
class Song extends Equatable {
  int trackId;
  String artistName;
  String collectionName;
  String trackName;
  String previewUrl;
  String artworkUrl100;

  Song({
    this.trackId = 0,
    this.artistName = "",
    this.collectionName = "",
    this.trackName = "",
    this.previewUrl = "",
    this.artworkUrl100 = "",
  });

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);

  @override
  List<Object?> get props => [
        trackId,
        artistName,
        collectionName,
        trackName,
        previewUrl,
        artworkUrl100
      ];
}
