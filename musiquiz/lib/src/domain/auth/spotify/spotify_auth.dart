import 'package:spotify_sdk/spotify_sdk.dart';

import 'spotify_access_token_holder.dart';

class SpotifyAuth {
  final SpotifyAccessTokenHolder _accessTokenHolder;

  SpotifyAuth(this._accessTokenHolder);

  Future<void> getAccessToken() async {
    final accessToken = await SpotifySdk.getAccessToken(
      clientId: _SpotifyAuthConstants.clientId,
      redirectUrl: _SpotifyAuthConstants.redirectUrl,
      scope: _SpotifyAuthConstants.scopes.join(','),
    );
    _accessTokenHolder.accessToken = accessToken;
  }
}

abstract class _SpotifyAuthConstants {
  static const clientId = '3d2b127e03d84d57a40d75c65e44783f';
  static const scopes = ['user-library-read'];
  static const redirectUrl = 'http://localhost:8080/spotify_token_redirect';
}
