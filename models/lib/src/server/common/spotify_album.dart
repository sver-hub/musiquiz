import 'package:json_annotation/json_annotation.dart';

import '../../common/image.dart';
import 'spotify_artist_simple.dart';

part 'spotify_album.g.dart';

@JsonSerializable(createToJson: false)
class SpotifyAlbum {
  final String id;
  final List<Image> images;
  final String name;
  final List<SpotifyArtistSimple> artists;

  SpotifyAlbum(this.id, this.images, this.name, this.artists);

  factory SpotifyAlbum.fromJson(Map<String, dynamic> json) =>
      _$SpotifyAlbumFromJson(json);
}
