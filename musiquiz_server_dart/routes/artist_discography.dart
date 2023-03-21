import 'package:dart_frog/dart_frog.dart';
import 'package:musiquiz_server_dart/src/parsers/header_parser.dart';
import 'package:musiquiz_server_dart/src/parsers/query_parser.dart';
import 'package:musiquiz_server_dart/src/service/music_data_service.dart';

Future<Response> onRequest(RequestContext context) async {
  const artistIdQueryKey = 'artist_id';
  const onlySavedQueryKey = 'only_saved';

  final request = context.request;

  final accessToken = HeaderParser.parseAuthorizationBearer(request.headers);
  if (accessToken == null) {
    return Response(statusCode: 400, body: 'Missing spotify access token');
  }

  final artistId = request.getQueryString(artistIdQueryKey);
  if (artistId == null) {
    return Response(statusCode: 400, body: 'Missing artist id');
  }
  final onlySaved = request.getQueryBool(onlySavedQueryKey);

  final musicDataService = MusicDataService.create(accessToken);
  final data = await musicDataService.getArtistsDiscography(
    artistId: artistId,
    onlySaved: onlySaved,
  );

  return Response.json(body: data.toJson());
}
