// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_albums_tracks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifyAlbumsTracksResponse _$SpotifyAlbumsTracksResponseFromJson(
        Map<String, dynamic> json) =>
    SpotifyAlbumsTracksResponse(
      json['total'] as int,
      (json['items'] as List<dynamic>)
          .map((e) => SpotifyAlbumsTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SpotifyAlbumsTrack _$SpotifyAlbumsTrackFromJson(Map<String, dynamic> json) =>
    SpotifyAlbumsTrack(
      json['id'] as String,
      json['name'] as String,
      (json['artists'] as List<dynamic>)
          .map((e) => SpotifyAlbumsArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['track_number'] as int,
    );

SpotifyAlbumsArtist _$SpotifyAlbumsArtistFromJson(Map<String, dynamic> json) =>
    SpotifyAlbumsArtist(
      json['id'] as String,
      json['name'] as String,
    );
