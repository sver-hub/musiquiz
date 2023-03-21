import 'package:json_annotation/json_annotation.dart';

import 'music_data/artist.dart';
import 'music_data/track.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(defaultValue: [])
  final List<Track> tracks;
  @JsonKey(defaultValue: [])
  final List<Artist> artists;

  SearchResponse({
    this.tracks = const [],
    this.artists = const [],
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
