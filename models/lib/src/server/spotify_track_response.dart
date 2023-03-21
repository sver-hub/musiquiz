import 'package:json_annotation/json_annotation.dart';

import '../common/image.dart';

part 'spotify_track_response.g.dart';

@JsonSerializable()
class SpotifyTrackResponse {
  final String id;
  final String name;
  final SpotifyTrackAlbum album;
  final List<SpotifyTrackArtist> artists;

  SpotifyTrackResponse(this.id, this.name, this.album, this.artists);

  factory SpotifyTrackResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifyTrackResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifyTrackResponseToJson(this);
}

@JsonSerializable()
class SpotifyTrackAlbum {
  final String id;
  final String name;
  final List<Image> images;

  SpotifyTrackAlbum(this.id, this.name, this.images);

  factory SpotifyTrackAlbum.fromJson(Map<String, dynamic> json) =>
      _$SpotifyTrackAlbumFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifyTrackAlbumToJson(this);
}

@JsonSerializable()
class SpotifyTrackArtist {
  final String id;
  final String name;

  SpotifyTrackArtist(this.id, this.name);

  factory SpotifyTrackArtist.fromJson(Map<String, dynamic> json) =>
      _$SpotifyTrackArtistFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifyTrackArtistToJson(this);
}
