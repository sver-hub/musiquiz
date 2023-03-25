import 'package:json_annotation/json_annotation.dart';

part 'spotify_artist_simple.g.dart';

@JsonSerializable(createToJson: false)
class SpotifyArtistSimple {
  final String id;
  final String name;

  SpotifyArtistSimple(this.id, this.name);

  factory SpotifyArtistSimple.fromJson(Map<String, dynamic> json) =>
      _$SpotifyArtistSimpleFromJson(json);
}
