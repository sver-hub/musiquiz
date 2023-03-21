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
      SpotifyTrackAlbum.fromJson(json['album'] as Map<String, dynamic>),
      (json['artists'] as List<dynamic>)
          .map((e) => SpotifyTrackArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpotifyTrackResponseToJson(
        SpotifyTrackResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'album': instance.album.toJson(),
      'artists': instance.artists.map((e) => e.toJson()).toList(),
    };

SpotifyTrackAlbum _$SpotifyTrackAlbumFromJson(Map<String, dynamic> json) =>
    SpotifyTrackAlbum(
      json['id'] as String,
      json['name'] as String,
      (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpotifyTrackAlbumToJson(SpotifyTrackAlbum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images.map((e) => e.toJson()).toList(),
    };

SpotifyTrackArtist _$SpotifyTrackArtistFromJson(Map<String, dynamic> json) =>
    SpotifyTrackArtist(
      json['id'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$SpotifyTrackArtistToJson(SpotifyTrackArtist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
