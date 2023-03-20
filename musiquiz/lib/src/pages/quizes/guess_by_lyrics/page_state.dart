import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'page_state.freezed.dart';

@freezed
class GuessByLyricsPageState with _$GuessByLyricsPageState {
  const GuessByLyricsPageState._();

  factory GuessByLyricsPageState.loading() = _GuessByLyricsPageStateLoading;

  factory GuessByLyricsPageState.error({
    required String message,
  }) = _GuessByLyricsPageStateError;

  factory GuessByLyricsPageState.data({
    required List<GuessByLyricsQuizItemState> items,
    @Default(0) int score,
    @Default(0) int currentItemIndex,
  }) = GuessByLyricsPageStateData;

  factory GuessByLyricsPageState.done({
    required int score,
  }) = _GuessByLyricsPageStateDone;

  GuessByLyricsPageStateData get data {
    final data = maybeMap(data: (data) => data, orElse: () => null);
    if (data == null) {
      throw StateError('Page state != .data');
    }
    return data;
  }
}

@freezed
class GuessByLyricsQuizItemState with _$GuessByLyricsQuizItemState {
  const GuessByLyricsQuizItemState._();

  factory GuessByLyricsQuizItemState({
    required String lyrics,
    required MaskedText track,
    required MaskedText album,
    required List<MaskedText> artists,
  }) = _GuessByLyricsQuizItemState;

  factory GuessByLyricsQuizItemState.create(GuessByLyricsQuizItem item) =>
      GuessByLyricsQuizItemState(
        lyrics: item.lyrics,
        track: MaskedText.create(item.trackName),
        album: MaskedText.create(item.albumName),
        artists: item.artistNames.map(MaskedText.create).toList(),
      );
}

@freezed
class MaskedText with _$MaskedText {
  const MaskedText._();

  factory MaskedText({
    required String name,
    required String mask,
  }) = _MaskedText;

  factory MaskedText.create(String value) =>
      MaskedText(name: value, mask: value.replaceAll(RegExp(r'\w'), '*'));

  bool get isRevealed => name == mask;

  MaskedText reveal() => copyWith(mask: name);

  MaskedText hint() {
    if (isRevealed) {
      return this;
    } else {
      final index = mask.indexOf('*');
      return copyWith(mask: mask.replaceRange(index, index + 1, name[index]));
    }
  }

  bool check(String guess) =>
      !isRevealed && name.toLowerCase() == guess.toLowerCase();
}
