import 'package:json_annotation/json_annotation.dart';
import '../../common/image.dart';
import 'track.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  final String id;
  final String name;
  final List<Image> images;
  final List<Track> tracks;

  Album({
    required this.id,
    required this.name,
    required this.images,
    required this.tracks,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
