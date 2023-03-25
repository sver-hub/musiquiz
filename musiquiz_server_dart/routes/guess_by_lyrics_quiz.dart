import 'package:dart_frog/dart_frog.dart';
import 'package:models/models.dart';
import 'package:musiquiz_server_dart/src/models/exceptions.dart';
import 'package:musiquiz_server_dart/src/models/server_response.dart';
import 'package:musiquiz_server_dart/src/parsers/header_parser.dart';
import 'package:musiquiz_server_dart/src/parsers/query_parser.dart';
import 'package:musiquiz_server_dart/src/quizes/guess_by_lyrics_quiz.dart';
import 'package:musiquiz_server_dart/src/service/music_data_service.dart';

Future<Response> onRequest(RequestContext context) async {
  const artistIdQueryKey = 'artist_id';
  const albumIdQueryKey = 'album_id';
  const countQueryKey = 'count';

  final request = context.request;

  final accessToken = HeaderParser.parseAuthorizationBearer(request.headers);
  if (accessToken == null) {
    return ServerResponse.spotifyAuth401();
  }

  final artistId = request.getQueryString(artistIdQueryKey);
  final albumId = request.getQueryString(albumIdQueryKey);
  final count = request.getQueryInt(countQueryKey) ?? 10;

  final musicDataService = MusicDataService.create(accessToken);
  final quizCreator = GuessByLyricsQuiz(musicDataService);

  try {
    final GuessByLyricsQuizResponse quiz;
    if (artistId != null) {
      quiz = await quizCreator.createFromArtist(
        numberOfQuestions: count,
        artistId: artistId,
      );
    } else if (albumId != null) {
      quiz = await quizCreator.createFromAlbum(
        numberOfQuestions: count,
        albumId: albumId,
      );
    } else {
      quiz = await quizCreator.createFromRandomSavedTracks(
        numberOfQuestions: count,
      );
    }

    return ServerResponse.json(body: quiz.toJson());
  } on ExternalQueryException catch (e) {
    return ServerResponse.error400(e.message);
  }
}
