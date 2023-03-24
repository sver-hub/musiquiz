import 'package:json_annotation/json_annotation.dart';

part 'spotify_albums_tracks_response.g.dart';

@JsonSerializable(createToJson: false)
class SpotifyAlbumsTracksResponse {
  final int total;
  final List<SpotifyAlbumsTrack> items;

  SpotifyAlbumsTracksResponse(this.total, this.items);

  factory SpotifyAlbumsTracksResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifyAlbumsTracksResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class SpotifyAlbumsTrack {
  final String id;
  final String name;
  final List<SpotifyAlbumsArtist> artists;
  final int trackNumber;

  SpotifyAlbumsTrack(this.id, this.name, this.artists, this.trackNumber);

  factory SpotifyAlbumsTrack.fromJson(Map<String, dynamic> json) =>
      _$SpotifyAlbumsTrackFromJson(json);
}

@JsonSerializable(createToJson: false)
class SpotifyAlbumsArtist {
  final String id;
  final String name;

  SpotifyAlbumsArtist(this.id, this.name);

  factory SpotifyAlbumsArtist.fromJson(Map<String, dynamic> json) =>
      _$SpotifyAlbumsArtistFromJson(json);
}
