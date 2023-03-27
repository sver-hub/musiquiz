import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/auth/page.dart';
import '../pages/home/page.dart';
import '../pages/music/search/page.dart';
import '../pages/quizes/guess_by_lyrics/page.dart';
import 'auth_guard.dart';

part 'app_router.gr.dart';

final routerProvider = Provider(
  (ref) => AppRouter(ref.watch(authGuardProvider)),
);

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final AuthGuard _authGuard;

  AppRouter(this._authGuard);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: HomeRoute.page, guards: [_authGuard]),
        AutoRoute(path: '/auth', page: AuthRoute.page),
        AutoRoute(path: '/search', page: SearchRoute.page),
        AutoRoute(path: '/lyrics_quiz', page: GuessByLyricsQuizRoute.page),
      ];
}
