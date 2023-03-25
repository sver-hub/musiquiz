import 'package:json_annotation/json_annotation.dart';

import 'spotify_album.dart';
import 'spotify_artist_simple.dart';

part 'spotify_track.g.dart';

@JsonSerializable(createToJson: false)
class SpotifyTrack {
  final String id;
  final String name;
  final SpotifyAlbum album;
  final List<SpotifyArtistSimple> artists;

  SpotifyTrack(this.id, this.name, this.album, this.artists);

  factory SpotifyTrack.fromJson(Map<String, dynamic> json) =>
      _$SpotifyTrackFromJson(json);
}
