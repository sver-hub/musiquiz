import 'package:json_annotation/json_annotation.dart';
import 'package:models/src/server/spotify_artist_response.dart';
import 'package:models/src/server/spotify_track_response.dart';

part 'spotify_search_response.g.dart';

@JsonSerializable()
class SpotifySearchResponse {
  final SpotifySearchTracksResponse? tracks;
  final SpotifySearchArtistsResponse? artists;

  SpotifySearchResponse(this.tracks, this.artists);

  factory SpotifySearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifySearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifySearchResponseToJson(this);
}

@JsonSerializable()
class SpotifySearchTracksResponse {
  final int total;
  final List<SpotifyTrackResponse> items;

  SpotifySearchTracksResponse(this.total, this.items);

  factory SpotifySearchTracksResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifySearchTracksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifySearchTracksResponseToJson(this);
}

@JsonSerializable()
class SpotifySearchArtistsResponse {
  final int total;
  final List<SpotifyArtistResponse> items;

  SpotifySearchArtistsResponse(this.total, this.items);

  factory SpotifySearchArtistsResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifySearchArtistsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifySearchArtistsResponseToJson(this);
}
