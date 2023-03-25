import 'package:json_annotation/json_annotation.dart';

part 'artist_simple.g.dart';

@JsonSerializable()
class ArtistSimple {
  final String id;
  final String name;

  ArtistSimple({
    required this.id,
    required this.name,
  });

  factory ArtistSimple.fromJson(Map<String, dynamic> json) =>
      _$ArtistSimpleFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistSimpleToJson(this);
}
