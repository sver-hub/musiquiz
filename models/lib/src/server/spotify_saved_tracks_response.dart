import 'package:json_annotation/json_annotation.dart';

import '../common/image.dart';

part 'spotify_saved_tracks_response.g.dart';

@JsonSerializable()
class SpotifySavedTracksResponse {
  final int total;
  final int offset;
  final String? next;
  @JsonKey(name: 'items', fromJson: _tracksFromJson, toJson: _tracksToJson)
  final List<SpotifyTrack> tracks;

  SpotifySavedTracksResponse(this.total, this.offset, this.next, this.tracks);

  factory SpotifySavedTracksResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifySavedTracksResponseFromJson(json);
}

List<SpotifyTrack> _tracksFromJson(List<dynamic> list) =>
    list.map((e) => SpotifyTrack.fromJson(e['track'])).toList();

List<dynamic> _tracksToJson(List<SpotifyTrack> list) => [
      list.map((e) => {'track': e.toJson()})
    ];

@JsonSerializable()
class SpotifyTrack {
  final String id;
  final String name;
  final SpotifyTrackAlbum album;
  final List<SpotifyTrackArtist> artists;

  SpotifyTrack(this.id, this.name, this.album, this.artists);

  factory SpotifyTrack.fromJson(Map<String, dynamic> json) =>
      _$SpotifyTrackFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifyTrackToJson(this);
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
