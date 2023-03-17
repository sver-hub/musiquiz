import 'package:json_annotation/json_annotation.dart';
import '../common/image.dart';

part 'spotify_artists_albums_response.g.dart';

@JsonSerializable()
class SpotifyArtistsAlbumsResponse {
  final int total;
  final List<SpotifyArtistsAlbum> items;

  SpotifyArtistsAlbumsResponse(this.total, this.items);

  factory SpotifyArtistsAlbumsResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifyArtistsAlbumsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifyArtistsAlbumsResponseToJson(this);
}

@JsonSerializable()
class SpotifyArtistsAlbum {
  final String id;
  final List<Image> images;
  final String name;

  SpotifyArtistsAlbum(this.id, this.images, this.name);

  factory SpotifyArtistsAlbum.fromJson(Map<String, dynamic> json) =>
      _$SpotifyArtistsAlbumFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifyArtistsAlbumToJson(this);
}
