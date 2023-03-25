import 'package:json_annotation/json_annotation.dart';

import 'common/spotify_album.dart';
import 'common/spotify_track.dart';
import 'spotify_artist_response.dart';

part 'spotify_search_response.g.dart';

@JsonSerializable(createToJson: false)
class SpotifySearchResponse {
  final SpotifySearchTracksResponse? tracks;
  final SpotifySearchArtistsResponse? artists;
  final SpotifySearchAlbumsResponse? albums;

  SpotifySearchResponse(
    this.tracks,
    this.artists,
    this.albums,
  );

  factory SpotifySearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifySearchResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class SpotifySearchTracksResponse {
  final int total;
  final List<SpotifyTrack> items;

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

@JsonSerializable(createToJson: false)
class SpotifySearchAlbumsResponse {
  final int total;
  final List<SpotifyAlbum> items;

  SpotifySearchAlbumsResponse(this.total, this.items);

  factory SpotifySearchAlbumsResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifySearchAlbumsResponseFromJson(json);
}
