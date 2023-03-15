import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpotifyAccessTokenHolder extends StateNotifier<String?> {
  SpotifyAccessTokenHolder() : super(null);

  String? get accessToken => state;

  set accessToken(String? token) => state = token;
}
