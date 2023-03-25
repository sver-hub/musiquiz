import 'package:json_annotation/json_annotation.dart';
import 'package:models/src/shared/music_data/artist_simple.dart';

import '../../common/image.dart';
import 'track.dart';

part 'album_complete.g.dart';

@JsonSerializable()
class AlbumComplete {
  final String id;
  final String name;
  final List<Image> images;
  final List<Track> tracks;
  final List<ArtistSimple> artists;

  AlbumComplete({
    required this.id,
    required this.name,
    required this.images,
    required this.tracks,
    required this.artists,
  });

  factory AlbumComplete.fromJson(Map<String, dynamic> json) =>
      _$AlbumCompleteFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumCompleteToJson(this);
}
