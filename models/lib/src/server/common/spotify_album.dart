import 'package:json_annotation/json_annotation.dart';

import '../../common/image.dart';

part 'spotify_album.g.dart';

@JsonSerializable(createToJson: false)
class SpotifyAlbum {
  final String id;
  final List<Image> images;
  final String name;

  SpotifyAlbum(this.id, this.images, this.name);

  factory SpotifyAlbum.fromJson(Map<String, dynamic> json) =>
      _$SpotifyAlbumFromJson(json);
}
