import 'package:dart_frog/dart_frog.dart';
import 'package:musiquiz_server_dart/src/parsers/header_parser.dart';
import 'package:musiquiz_server_dart/src/quizes/guess_by_lyrics_quiz.dart';
import 'package:musiquiz_server_dart/src/service/music_data_service.dart';

Future<Response> onRequest(RequestContext context) async {
  final accessToken =
      HeaderParser.parseAuthorizationBearer(context.request.headers);
  if (accessToken == null) {
    return Response(statusCode: 400, body: 'Missing spotify access token');
  }

  final musicDataService = MusicDataService.create(accessToken);
  final quizCreator = GuessByLyricsQuiz(musicDataService);
  final quiz = await quizCreator.createQuiz(6);

  return Response.json(body: quiz.toJson());
}
