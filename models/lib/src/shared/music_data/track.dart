import 'package:json_annotation/json_annotation.dart';
import 'package:models/src/shared/music_data/simple_album.dart';
import 'simple_artist.dart';

part 'track.g.dart';

@JsonSerializable()
class Track {
  final String id;
  final String name;
  final String? lyrics;
  final List<SimpleArtist> artists;
  final SimpleAlbum album;

  Track({
    required this.id,
    required this.name,
    required this.artists,
    required this.album,
    this.lyrics,
  });

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
