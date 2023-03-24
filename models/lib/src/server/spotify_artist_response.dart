import 'package:json_annotation/json_annotation.dart';

import '../common/image.dart';

part 'spotify_artist_response.g.dart';

@JsonSerializable(createToJson: false)
class SpotifyArtistResponse {
  final String id;
  final String name;
  final List<Image> images;

  SpotifyArtistResponse(this.id, this.name, this.images);

  factory SpotifyArtistResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifyArtistResponseFromJson(json);
}
