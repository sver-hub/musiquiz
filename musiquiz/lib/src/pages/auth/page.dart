import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../di/service.dart';
import '../../di/state.dart';

@RoutePage()
class AuthPage extends HookConsumerWidget {
  final void Function(bool) onResult;

  const AuthPage({required this.onResult, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final spotifyAuth = ref.watch(spotifyAuthProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Auth page')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                try {
                  spotifyAuth.getAccessToken();
                  onResult(true);
                } on Exception catch (_) {
                  onResult(false);
                }
              },
              child: const Text('Spotify auth sdk'),
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
                  onPressed: () {
                    ref
                        .read(spotifyAccessTokenHolderProvider.notifier)
                        .accessToken = textController.text;
                    onResult(true);
                  },
                  child: const Text('Spotify auth token'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
