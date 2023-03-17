import 'package:models/models.dart';
import 'package:musiquiz_server_dart/src/models/tracks_with_lyrics.dart';
import 'package:musiquiz_server_dart/src/service/tracks_service.dart';

class GuessByLyricsQuiz {
  final TracksService _tracksService;

  GuessByLyricsQuiz(this._tracksService);

  Future<GuessByLyricsQuizResponse> createQuiz(int numberOfQuestions) async {
    final tracks = await _tracksService.getRandomTracks(numberOfQuestions);
    final items = tracks.map(_createQuizItem).toList();
    return GuessByLyricsQuizResponse(items);
  }
}

GuessByLyricsQuizItem _createQuizItem(TrackWithLyrics track) {
  return GuessByLyricsQuizItem(
    lyrics: track.lyrics!,
    trackName: track.track.name,
    albumName: track.track.album.name,
    artistNames: track.track.artists.map((e) => e.name).toList(),
  );
}
