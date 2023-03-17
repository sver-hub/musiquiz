import 'package:json_annotation/json_annotation.dart';

import 'music_data/track.dart';

part 'saved_tracks_response.g.dart';

@JsonSerializable()
class SavedTracksResponse {
  final List<Track> items;

  SavedTracksResponse(this.items);

  factory SavedTracksResponse.fromJson(Map<String, dynamic> json) =>
      _$SavedTracksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SavedTracksResponseToJson(this);
}
