import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../di/state.dart';

import '../../di/service.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spotifyAuth = ref.watch(spotifyAuthProvider);
    final hasToken = ref.watch(spotifyAccessTokenHolderProvider) != null;

    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      body: !hasToken
          ? Center(
              child: ElevatedButton(
                child: const Text('Spotify auth'),
                onPressed: () => spotifyAuth.getAccessToken(),
              ),
            )
          : Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      child: const Text('Get tracks'),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('saved_tracks'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: const Text('Guess by lyrics quiz'),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('lyrics_quiz'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
