import 'package:json_annotation/json_annotation.dart';

part 'simple_album.g.dart';

@JsonSerializable()
class SimpleAlbum {
  final String id;
  final String name;

  SimpleAlbum({
    required this.id,
    required this.name,
  });

  factory SimpleAlbum.fromJson(Map<String, dynamic> json) =>
      _$SimpleAlbumFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleAlbumToJson(this);
}
