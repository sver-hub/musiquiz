// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guess_by_lyrics_quiz_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuessByLyricsQuizResponse _$GuessByLyricsQuizResponseFromJson(
        Map<String, dynamic> json) =>
    GuessByLyricsQuizResponse(
      (json['items'] as List<dynamic>)
          .map((e) => GuessByLyricsQuizItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GuessByLyricsQuizResponseToJson(
        GuessByLyricsQuizResponse instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

GuessByLyricsQuizItem _$GuessByLyricsQuizItemFromJson(
        Map<String, dynamic> json) =>
    GuessByLyricsQuizItem(
      lyrics: json['lyrics'] as String,
      trackName: json['track_name'] as String,
      albumName: json['album_name'] as String,
      artistNames: (json['artist_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GuessByLyricsQuizItemToJson(
        GuessByLyricsQuizItem instance) =>
    <String, dynamic>{
      'lyrics': instance.lyrics,
      'track_name': instance.trackName,
      'album_name': instance.albumName,
      'artist_names': instance.artistNames,
    };
