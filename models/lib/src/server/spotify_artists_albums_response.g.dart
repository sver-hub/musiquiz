// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_artists_albums_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifyArtistsAlbumsResponse _$SpotifyArtistsAlbumsResponseFromJson(
        Map<String, dynamic> json) =>
    SpotifyArtistsAlbumsResponse(
      json['total'] as int,
      (json['items'] as List<dynamic>)
          .map((e) => SpotifyAlbum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
