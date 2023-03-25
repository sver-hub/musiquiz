// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      id: json['id'] as String,
      name: json['name'] as String,
      artists: (json['artists'] as List<dynamic>)
          .map((e) => ArtistSimple.fromJson(e as Map<String, dynamic>))
          .toList(),
      album: Album.fromJson(json['album'] as Map<String, dynamic>),
      lyrics: json['lyrics'] as String?,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lyrics': instance.lyrics,
      'artists': instance.artists.map((e) => e.toJson()).toList(),
      'album': instance.album.toJson(),
    };
