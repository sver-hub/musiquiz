import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/auth/spotify/spotify_access_token_holder.dart';

final spotifyAccessTokenHolderProvider =
    StateNotifierProvider<SpotifyAccessTokenHolder, String?>(
  (_) => SpotifyAccessTokenHolder(),
);
