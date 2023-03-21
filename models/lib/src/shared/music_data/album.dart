import 'package:json_annotation/json_annotation.dart';
import '../../common/image.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  final String id;
  final String name;
  final List<Image> images;

  Album({
    required this.id,
    required this.name,
    required this.images,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
