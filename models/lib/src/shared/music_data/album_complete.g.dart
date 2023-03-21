// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_complete.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumComplete _$AlbumCompleteFromJson(Map<String, dynamic> json) =>
    AlbumComplete(
      id: json['id'] as String,
      name: json['name'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      tracks: (json['tracks'] as List<dynamic>)
          .map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumCompleteToJson(AlbumComplete instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images.map((e) => e.toJson()).toList(),
      'tracks': instance.tracks.map((e) => e.toJson()).toList(),
    };
