import 'package:json_annotation/json_annotation.dart';
import 'package:models/src/server/spotify_artist_response.dart';
import 'package:models/src/server/spotify_track_response.dart';

part 'spotify_search_response.g.dart';

@JsonSerializable(createToJson: false)
class SpotifySearchResponse {
  final SpotifySearchTracksResponse? tracks;
  final SpotifySearchArtistsResponse? artists;

  SpotifySearchResponse(this.tracks, this.artists);

  factory SpotifySearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifySearchResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class SpotifySearchTracksResponse {
  final int total;
  final List<SpotifyTrackResponse> items;

  SpotifySearchTracksResponse(this.total, this.items);

  factory SpotifySearchTracksResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifySearchTracksResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class SpotifySearchArtistsResponse {
  final int total;
  final List<SpotifyArtistResponse> items;

  SpotifySearchArtistsResponse(this.total, this.items);

  factory SpotifySearchArtistsResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifySearchArtistsResponseFromJson(json);
}
