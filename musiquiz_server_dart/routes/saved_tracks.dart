import 'package:dart_frog/dart_frog.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:models/models.dart';
import 'package:models/server_models.dart';
import 'package:musiquiz_server_dart/src/parsers/header_parser.dart';
import 'package:musiquiz_server_dart/src/util/dio_x.dart';
import 'package:musiquiz_server_dart/src/util/spotify_model_converter.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  final accessToken = HeaderParser.parseAuthorizationBearer(request.headers);
  if (accessToken == null) {
    return Response(statusCode: 400, body: 'Missing spotify access token');
  }

  final dio = Dio(
    BaseOptions(
      headers: {
        ...HeaderParser.createAuthorizationBearer(accessToken),
        ...HeaderParser.createContentTypeJson(),
      },
    ),
  );

  final items = <Track>[];
  String? nextPagePath;
  do {
    final spotifyResponse = await dio.getJson(
      nextPagePath ?? '${_Constants.baseUrl}${_Constants.path}',
      queryParameters: {_Constants.limitQuery: _Constants.maxLimit},
    );
    if (spotifyResponse.statusCode == 200) {
      final data = SpotifySavedTracksResponse.fromJson(spotifyResponse.data!);
      nextPagePath = data.next;
      items.addAll(data.tracks.map((e) => e.asTrack));
    }
  } while (nextPagePath != null);

  final response = SavedTracksResponse(items).toJson();

  return Response.json(
    body: response,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST,GET,DELETE,PUT,OPTIONS',
      'Access-Control-Allow-Headers': 'X-Requested-With,content-type',
    },
  );
}

abstract class _Constants {
  static const limitQuery = 'limit';

  static const baseUrl = 'https://api.spotify.com';
  static const path = '/v1/me/tracks';
  static const maxLimit = 50;
}
