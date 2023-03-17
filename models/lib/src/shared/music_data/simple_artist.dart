import 'package:json_annotation/json_annotation.dart';

part 'simple_artist.g.dart';

@JsonSerializable()
class SimpleArtist {
  final String id;
  final String name;

  SimpleArtist({
    required this.id,
    required this.name,
  });

  factory SimpleArtist.fromJson(Map<String, dynamic> json) =>
      _$SimpleArtistFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleArtistToJson(this);
}
