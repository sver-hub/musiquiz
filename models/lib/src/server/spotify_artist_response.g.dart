// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_artist_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifyArtistResponse _$SpotifyArtistResponseFromJson(
        Map<String, dynamic> json) =>
    SpotifyArtistResponse(
      json['id'] as String,
      json['name'] as String,
      (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
