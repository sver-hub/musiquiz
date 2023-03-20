import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpotifyAccessTokenHolder extends StateNotifier<String?> {
  SpotifyAccessTokenHolder() : super(null);

  String? get accessToken => state;

  String get requireAccessToken {
    final token = accessToken;
    if (token == null) {
      throw StateError('Access token is null');
    }
    return token;
  }

  set accessToken(String? token) => state = token;
}
