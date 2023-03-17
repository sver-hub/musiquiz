import 'package:json_annotation/json_annotation.dart';

part 'guess_by_lyrics_quiz_response.g.dart';

@JsonSerializable()
class GuessByLyricsQuizResponse {
  final List<GuessByLyricsQuizItem> items;

  GuessByLyricsQuizResponse(this.items);

  factory GuessByLyricsQuizResponse.fromJson(Map<String, dynamic> json) =>
      _$GuessByLyricsQuizResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GuessByLyricsQuizResponseToJson(this);
}

@JsonSerializable()
class GuessByLyricsQuizItem {
  final String lyrics;
  final String trackName;
  final String albumName;
  final List<String> artistNames;

  GuessByLyricsQuizItem({
    required this.lyrics,
    required this.trackName,
    required this.albumName,
    required this.artistNames,
  });

  factory GuessByLyricsQuizItem.fromJson(Map<String, dynamic> json) =>
      _$GuessByLyricsQuizItemFromJson(json);

  Map<String, dynamic> toJson() => _$GuessByLyricsQuizItemToJson(this);
}
