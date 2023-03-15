// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_tracks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedTracksResponse _$SavedTracksResponseFromJson(Map<String, dynamic> json) =>
    SavedTracksResponse(
      (json['items'] as List<dynamic>)
          .map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SavedTracksResponseToJson(
        SavedTracksResponse instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
