// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifySearchResponse _$SpotifySearchResponseFromJson(
        Map<String, dynamic> json) =>
    SpotifySearchResponse(
      json['tracks'] == null
          ? null
          : SpotifySearchTracksResponse.fromJson(
              json['tracks'] as Map<String, dynamic>),
      json['artists'] == null
          ? null
          : SpotifySearchArtistsResponse.fromJson(
              json['artists'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpotifySearchResponseToJson(
        SpotifySearchResponse instance) =>
    <String, dynamic>{
      'tracks': instance.tracks?.toJson(),
      'artists': instance.artists?.toJson(),
    };

SpotifySearchTracksResponse _$SpotifySearchTracksResponseFromJson(
        Map<String, dynamic> json) =>
    SpotifySearchTracksResponse(
      json['total'] as int,
      (json['items'] as List<dynamic>)
          .map((e) => SpotifyTrackResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpotifySearchTracksResponseToJson(
        SpotifySearchTracksResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

SpotifySearchArtistsResponse _$SpotifySearchArtistsResponseFromJson(
        Map<String, dynamic> json) =>
    SpotifySearchArtistsResponse(
      json['total'] as int,
      (json['items'] as List<dynamic>)
          .map((e) => SpotifyArtistResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpotifySearchArtistsResponseToJson(
        SpotifySearchArtistsResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
