// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_saved_tracks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifySavedTracksResponse _$SpotifySavedTracksResponseFromJson(
        Map<String, dynamic> json) =>
    SpotifySavedTracksResponse(
      json['total'] as int,
      json['offset'] as int,
      json['next'] as String?,
      _tracksFromJson(json['items'] as List),
    );
