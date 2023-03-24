// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_track_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifyTrackResponse _$SpotifyTrackResponseFromJson(
        Map<String, dynamic> json) =>
    SpotifyTrackResponse(
      json['id'] as String,
      json['name'] as String,
      SpotifyAlbum.fromJson(json['album'] as Map<String, dynamic>),
      (json['artists'] as List<dynamic>)
          .map((e) => SpotifyTrackArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SpotifyTrackArtist _$SpotifyTrackArtistFromJson(Map<String, dynamic> json) =>
    SpotifyTrackArtist(
      json['id'] as String,
      json['name'] as String,
    );
