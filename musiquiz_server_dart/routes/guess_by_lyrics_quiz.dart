import 'package:dart_frog/dart_frog.dart';
import 'package:musiquiz_server_dart/src/musixmatch/musixmatch_api.dart';
import 'package:musiquiz_server_dart/src/parsers/header_parser.dart';
import 'package:musiquiz_server_dart/src/quizes/guess_by_lyrics_quiz.dart';
import 'package:musiquiz_server_dart/src/service/tracks_service.dart';
import 'package:musiquiz_server_dart/src/spotify/spotify_api.dart';

Future<Response> onRequest(RequestContext context) async {
  final accessToken =
      HeaderParser.parseAuthorizationBearer(context.request.headers);
  if (accessToken == null) {
    return Response(statusCode: 400, body: 'Missing spotify access token');
  }

  final spotifyApi = SpotifyApi(accessToken);
  final musixmatchApi = MusixmatchApi();
  final tracksService = TracksService(spotifyApi, musixmatchApi);
  final quizCreator = GuessByLyricsQuiz(tracksService);
  final quiz = await quizCreator.createQuiz(6);

  return Response.json(body: quiz.toJson());
}
