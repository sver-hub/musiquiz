import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:musiquiz/src/domain/api/api.dart';

import 'page_state.dart';

class GuessByLyricsPageController
    extends StateNotifier<GuessByLyricsPageState> {
  final Api _api;

  GuessByLyricsPageController(this._api)
      : super(GuessByLyricsPageState.loading());

  Future<void> init() async {
    clear();
    try {
      final data = await _api.getGuessByLyricsQuiz();
      final items = data.items.map(GuessByLyricsQuizItemState.create).toList();
      state = GuessByLyricsPageState.data(items: items);
    } on Exception catch (e) {
      state = GuessByLyricsPageState.error(message: e.toString());
    }
  }

  void onSubmitAnswer(String guess) {
    final data = state.data;
    var currentItem = data.items[data.currentItemIndex];
    var scoreToAdd = 0;
    if (currentItem.track.check(guess)) {
      currentItem = currentItem.copyWith(track: currentItem.track.reveal());
      scoreToAdd++;
    }
    if (currentItem.album.check(guess)) {
      currentItem = currentItem.copyWith(album: currentItem.album.reveal());
      scoreToAdd++;
    }
    if (currentItem.artists.any((e) => e.check(guess))) {
      currentItem = currentItem.copyWith(
        artists: currentItem.artists
            .map((e) => e.check(guess) ? e.reveal() : e)
            .toList(),
      );
      scoreToAdd++;
    }

    final newItems = [...data.items];
    newItems[data.currentItemIndex] = currentItem;
    state = data.copyWith(items: newItems, score: data.score + scoreToAdd);
  }

  void onHint() {
    final data = state.data;
    final currentItem = data.items[data.currentItemIndex];
    final newCurrentItem = currentItem.copyWith(
      track: currentItem.track.hint(),
      album: currentItem.album.hint(),
      artists: currentItem.artists.map((e) => e.hint()).toList(),
    );

    final newItems = [...data.items];
    newItems[data.currentItemIndex] = newCurrentItem;
    state = data.copyWith(items: newItems);
  }

  void addScore(int value) {
    final data = state.data;
    state = data.copyWith(score: data.score + value);
  }

  void onNextItem() {
    final data = state.data;
    final nextIndex = data.currentItemIndex + 1;
    if (nextIndex < data.items.length) {
      state = data.copyWith(currentItemIndex: nextIndex);
    } else {
      state = GuessByLyricsPageState.done(score: data.score);
    }
  }

  void clear() => state = GuessByLyricsPageState.loading();
}
