import 'package:models/models.dart';
import 'package:musiquiz_server_dart/src/service/music_data_service.dart';

class GuessByLyricsQuiz {
  final MusicDataService _musicDataService;

  GuessByLyricsQuiz(this._musicDataService);

  Future<GuessByLyricsQuizResponse> createQuiz(int numberOfQuestions) async {
    final tracks = await _musicDataService.getRandomTracks(
      numberOfTracks: numberOfQuestions,
      withLyrics: true,
    );
    final items = tracks.map(_createQuizItem).toList();
    return GuessByLyricsQuizResponse(items);
  }
}

GuessByLyricsQuizItem _createQuizItem(Track track) {
  return GuessByLyricsQuizItem(
    lyrics: track.lyrics!,
    trackName: track.name,
    albumName: track.album.name,
    artistNames: track.artists.map((e) => e.name).toList(),
  );
}
