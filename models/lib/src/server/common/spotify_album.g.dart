// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifyAlbum _$SpotifyAlbumFromJson(Map<String, dynamic> json) => SpotifyAlbum(
      json['id'] as String,
      (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['name'] as String,
    );
