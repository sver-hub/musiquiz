import 'package:json_annotation/json_annotation.dart';

import 'common/spotify_track.dart';

part 'spotify_saved_tracks_response.g.dart';

@JsonSerializable(createToJson: false)
class SpotifySavedTracksResponse {
  final int total;
  final int offset;
  final String? next;
  @JsonKey(name: 'items', fromJson: _tracksFromJson)
  final List<SpotifyTrack> tracks;

  SpotifySavedTracksResponse(this.total, this.offset, this.next, this.tracks);

  factory SpotifySavedTracksResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifySavedTracksResponseFromJson(json);
}

List<SpotifyTrack> _tracksFromJson(List<dynamic> list) =>
    list.map((e) => SpotifyTrack.fromJson(e['track'])).toList();
