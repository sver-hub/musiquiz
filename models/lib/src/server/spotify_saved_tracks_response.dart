import 'package:json_annotation/json_annotation.dart';

import '../track.dart';

part 'spotify_saved_tracks_response.g.dart';

@JsonSerializable()
class SpotifySavedTracksResponse {
  final int total;
  final int offset;
  final String? next;
  @JsonKey(name: 'items', fromJson: _tracksFromJson, toJson: _tracksToJson)
  final List<Track> tracks;

  SpotifySavedTracksResponse(this.total, this.offset, this.next, this.tracks);

  factory SpotifySavedTracksResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifySavedTracksResponseFromJson(json);
}

List<Track> _tracksFromJson(List<dynamic> list) =>
    list.map((e) => Track.fromJson(e['track'])).toList();

List<dynamic> _tracksToJson(List<Track> list) => [
      list.map((e) => {'track': e.toJson()})
    ];
