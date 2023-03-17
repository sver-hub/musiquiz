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
          .map((e) => SpotifyArtistsAlbum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpotifyArtistsAlbumsResponseToJson(
        SpotifyArtistsAlbumsResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

SpotifyArtistsAlbum _$SpotifyArtistsAlbumFromJson(Map<String, dynamic> json) =>
    SpotifyArtistsAlbum(
      json['id'] as String,
      (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['name'] as String,
    );

Map<String, dynamic> _$SpotifyArtistsAlbumToJson(
        SpotifyArtistsAlbum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images.map((e) => e.toJson()).toList(),
      'name': instance.name,
    };
