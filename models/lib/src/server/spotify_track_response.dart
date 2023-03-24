import 'package:json_annotation/json_annotation.dart';

import 'common/spotify_album.dart';

part 'spotify_track_response.g.dart';

@JsonSerializable(createToJson: false)
class SpotifyTrackResponse {
  final String id;
  final String name;
  final SpotifyAlbum album;
  final List<SpotifyTrackArtist> artists;

  SpotifyTrackResponse(this.id, this.name, this.album, this.artists);

  factory SpotifyTrackResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifyTrackResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class SpotifyTrackArtist {
  final String id;
  final String name;

  SpotifyTrackArtist(this.id, this.name);

  factory SpotifyTrackArtist.fromJson(Map<String, dynamic> json) =>
      _$SpotifyTrackArtistFromJson(json);
}
