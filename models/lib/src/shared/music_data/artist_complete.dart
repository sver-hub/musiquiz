import 'package:json_annotation/json_annotation.dart';
import 'package:models/src/common/image.dart';

import 'album_complete.dart';

part 'artist_complete.g.dart';

@JsonSerializable()
class ArtistComplete {
  final String id;
  final String name;
  final List<AlbumComplete> albums;
  final List<Image> images;

  ArtistComplete({
    required this.id,
    required this.name,
    required this.albums,
    required this.images,
  });

  factory ArtistComplete.fromJson(Map<String, dynamic> json) =>
      _$ArtistCompleteFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistCompleteToJson(this);
}
