// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_saved_tracks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifySavedTracksResponse _$SpotifySavedTracksResponseFromJson(
        Map<String, dynamic> json) =>
    SpotifySavedTracksResponse(
      json['total'] as int,
      json['offset'] as int,
      json['next'] as String?,
      _tracksFromJson(json['items'] as List),
    );

Map<String, dynamic> _$SpotifySavedTracksResponseToJson(
        SpotifySavedTracksResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'offset': instance.offset,
      'next': instance.next,
      'items': _tracksToJson(instance.tracks),
    };

SpotifyTrack _$SpotifyTrackFromJson(Map<String, dynamic> json) => SpotifyTrack(
      json['id'] as String,
      json['name'] as String,
      SpotifyTrackAlbum.fromJson(json['album'] as Map<String, dynamic>),
      (json['artists'] as List<dynamic>)
          .map((e) => SpotifyTrackArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpotifyTrackToJson(SpotifyTrack instance) =>
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
