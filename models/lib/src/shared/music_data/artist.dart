import 'package:json_annotation/json_annotation.dart';
import 'package:models/src/common/image.dart';

import 'album.dart';

part 'artist.g.dart';

@JsonSerializable()
class Artist {
  final String id;
  final String name;
  final List<Album> albums;
  final List<Image> images;

  Artist({
    required this.id,
    required this.name,
    required this.albums,
    required this.images,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}
