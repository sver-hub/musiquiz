import 'package:json_annotation/json_annotation.dart';

import 'spotify_track_response.dart';

part 'spotify_saved_tracks_response.g.dart';

@JsonSerializable(createToJson: false)
class SpotifySavedTracksResponse {
  final int total;
  final int offset;
  final String? next;
  @JsonKey(name: 'items', fromJson: _tracksFromJson)
  final List<SpotifyTrackResponse> tracks;

  SpotifySavedTracksResponse(this.total, this.offset, this.next, this.tracks);

  factory SpotifySavedTracksResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifySavedTracksResponseFromJson(json);
}

List<SpotifyTrackResponse> _tracksFromJson(List<dynamic> list) =>
    list.map((e) => SpotifyTrackResponse.fromJson(e['track'])).toList();
