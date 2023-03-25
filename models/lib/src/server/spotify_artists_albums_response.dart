import 'package:json_annotation/json_annotation.dart';

import 'common/spotify_album.dart';

part 'spotify_artists_albums_response.g.dart';

@JsonSerializable(createToJson: false)
class SpotifyArtistsAlbumsResponse {
  final int total;
  final List<SpotifyAlbum> items;

  SpotifyArtistsAlbumsResponse(this.total, this.items);

  factory SpotifyArtistsAlbumsResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifyArtistsAlbumsResponseFromJson(json);
}
