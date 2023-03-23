import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../di/state.dart';

import '../../di/service.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spotifyAuth = ref.watch(spotifyAuthProvider);
    final hasToken = ref.watch(spotifyAccessTokenHolderProvider) != null;
    final textController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      body: !hasToken
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    child: const Text('Spotify auth sdk'),
                    onPressed: () => spotifyAuth.getAccessToken(),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: textController,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => ref
                            .read(spotifyAccessTokenHolderProvider.notifier)
                            .accessToken = textController.text,
                        child: const Text('Spotify auth token'),
                      ),
                    ],
                  ),
                ],
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
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: const Text('Search'),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('search'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
