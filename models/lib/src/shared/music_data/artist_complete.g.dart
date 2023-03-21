// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_complete.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistComplete _$ArtistCompleteFromJson(Map<String, dynamic> json) =>
    ArtistComplete(
      id: json['id'] as String,
      name: json['name'] as String,
      albums: (json['albums'] as List<dynamic>)
          .map((e) => AlbumComplete.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtistCompleteToJson(ArtistComplete instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'albums': instance.albums.map((e) => e.toJson()).toList(),
      'images': instance.images.map((e) => e.toJson()).toList(),
    };
