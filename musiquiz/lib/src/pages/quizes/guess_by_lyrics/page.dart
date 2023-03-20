import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:musiquiz/src/di/service.dart';

import 'page_state.dart';
import 'page_controller.dart';

final _pageStateProvider =
    StateNotifierProvider<GuessByLyricsPageController, GuessByLyricsPageState>(
  (ref) => GuessByLyricsPageController(ref.watch(apiProvider)),
);

class GuessByLyricsQuizPage extends HookConsumerWidget {
  const GuessByLyricsQuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(_pageStateProvider.notifier);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        pageController.init();
      });

      return null;
    }, const []);

    final pageState = ref.watch(_pageStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Guess by lyrics')),
      body: pageState.when(
        data: (items, score, index) => _Quiz(
          score: score,
          item: items[index],
        ),
        error: (message) => Center(
          child: Text(message),
        ),
        loading: () => const Center(
          child: SizedBox.square(
            dimension: 50,
            child: CircularProgressIndicator(),
          ),
        ),
        done: (score) => _Result(score),
      ),
    );
  }
}

class _Quiz extends StatelessWidget {
  final int score;
  final GuessByLyricsQuizItemState item;

  const _Quiz({
    required this.score,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Center(child: Text('score: $score')),
        ),
        _QuizItem(item)
      ],
    );
  }
}

class _QuizItem extends HookConsumerWidget {
  final GuessByLyricsQuizItemState item;

  const _QuizItem(this.item);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final pageController = ref.watch(_pageStateProvider.notifier);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 600,
            height: 400,
            child: SingleChildScrollView(
              child: Text(item.lyrics),
            ),
          ),
          const SizedBox(height: 30),
          Text('track: ${item.track.mask}'),
          Text('album: ${item.album.mask}'),
          Text(
              'artist${item.artists.length > 1 ? 's' : ''}: ${item.artists.map((e) => e.mask).join(', ')}'),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  controller: controller,
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  pageController.onSubmitAnswer(controller.text);
                  controller.text = '';
                },
                child: const Text('Guess'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: pageController.onHint,
                child: const Text('Hint'),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: pageController.onNextItem,
            child: const Text('Next'),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _Result extends StatelessWidget {
  final int score;

  const _Result(this.score);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Well done! Your score: $score'),
    );
  }
}
