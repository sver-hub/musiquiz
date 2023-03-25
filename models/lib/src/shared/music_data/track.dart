import 'package:json_annotation/json_annotation.dart';

import 'album.dart';
import 'artist_simple.dart';

part 'track.g.dart';

@JsonSerializable()
class Track {
  final String id;
  final String name;
  final String? lyrics;
  final List<ArtistSimple> artists;
  final Album album;

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
