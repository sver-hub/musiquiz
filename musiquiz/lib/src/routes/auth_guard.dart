import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../di/state.dart';
import '../domain/auth/spotify/spotify_access_token_holder.dart';
import 'app_router.dart';

final authGuardProvider = Provider(
  (ref) => AuthGuard(ref.watch(spotifyAccessTokenHolderProvider.notifier)),
);

class AuthGuard extends AutoRouteGuard {
  final SpotifyAccessTokenHolder _accessTokenHolder;

  AuthGuard(this._accessTokenHolder);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_accessTokenHolder.accessToken != null) {
      resolver.next();
    } else {
      router.push(
        AuthRoute(onResult: (success) {
          if (success) {
            router.replace(resolver.route.toPageRouteInfo());
            resolver.next(false);
          }
        }),
      );
    }
  }
}
