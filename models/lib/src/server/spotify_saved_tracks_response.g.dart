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

Map<String, dynamic> _$SpotifySavedTracksResponseToJson(
        SpotifySavedTracksResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'offset': instance.offset,
      'next': instance.next,
      'items': _tracksToJson(instance.tracks),
    };
