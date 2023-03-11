import 'package:json_annotation/json_annotation.dart';

part 'spotify_token_response.g.dart';

/// return type of https://accounts.spotify.com/api/token
@JsonSerializable()
class SpotifyTokenResponse {
  const SpotifyTokenResponse({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.refreshToken,
    required this.scope,
  });

  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final String refreshToken;
  final String scope;

  factory SpotifyTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$SpotifyTokenResponseFromJson(json);

  Map<String, dynamic> get toJson => _$SpotifyTokenResponseToJson(this);
}
