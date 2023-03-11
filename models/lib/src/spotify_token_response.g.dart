// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifyTokenResponse _$SpotifyTokenResponseFromJson(
        Map<String, dynamic> json) =>
    SpotifyTokenResponse(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      expiresIn: json['expires_in'] as int,
      refreshToken: json['refresh_token'] as String,
      scope: json['scope'] as String,
    );

Map<String, dynamic> _$SpotifyTokenResponseToJson(
        SpotifyTokenResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'refresh_token': instance.refreshToken,
      'scope': instance.scope,
    };
