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
      json['albums'] == null
          ? null
          : SpotifySearchAlbumsResponse.fromJson(
              json['albums'] as Map<String, dynamic>),
    );

SpotifySearchTracksResponse _$SpotifySearchTracksResponseFromJson(
        Map<String, dynamic> json) =>
    SpotifySearchTracksResponse(
      json['total'] as int,
      (json['items'] as List<dynamic>)
          .map((e) => SpotifyTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SpotifySearchArtistsResponse _$SpotifySearchArtistsResponseFromJson(
        Map<String, dynamic> json) =>
    SpotifySearchArtistsResponse(
      json['total'] as int,
      (json['items'] as List<dynamic>)
          .map((e) => SpotifyArtistResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SpotifySearchAlbumsResponse _$SpotifySearchAlbumsResponseFromJson(
        Map<String, dynamic> json) =>
    SpotifySearchAlbumsResponse(
      json['total'] as int,
      (json['items'] as List<dynamic>)
          .map((e) => SpotifyAlbum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
