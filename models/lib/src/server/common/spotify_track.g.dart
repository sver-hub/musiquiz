// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifyTrack _$SpotifyTrackFromJson(Map<String, dynamic> json) => SpotifyTrack(
      json['id'] as String,
      json['name'] as String,
      SpotifyAlbum.fromJson(json['album'] as Map<String, dynamic>),
      (json['artists'] as List<dynamic>)
          .map((e) => SpotifyArtistSimple.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
