import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'state.dart';

import '../domain/api/api.dart';
import '../domain/auth/spotify/spotify_auth.dart';

final apiProvider = Provider((ref) => Api(
      ref.watch(spotifyAccessTokenHolderProvider.notifier),
    ));

final spotifyAuthProvider = Provider((ref) => SpotifyAuth(
      ref.watch(spotifyAccessTokenHolderProvider.notifier),
    ));
