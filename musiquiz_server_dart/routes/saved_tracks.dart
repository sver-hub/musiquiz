import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:models/models.dart';
import 'package:models/server_models.dart';
import 'package:musiquiz_server_dart/src/util/dio_x.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  // TODO match Bearer
  final accessToken = request.headers[_Constants.authorization]?.split(' ')[1];
  if (accessToken == null) {
    return Response(statusCode: 400, body: 'Missing spotify access token');
  }
  final limit =
      int.tryParse(request.uri.queryParameters[_Constants.limitQuery] ?? '') ??
          _Constants.defaultLimit;

  final items = <Track>[];
  var tracksLeft = limit;
  do {
    final dio = Dio(
      BaseOptions(
        baseUrl: _Constants.baseUrl,
        headers: {
          _Constants.authorization: 'Bearer $accessToken',
          ..._Constants.contentTypeHeader,
        },
      ),
    );
    final spotifyResponse = await dio.getJson(_Constants.path);
    if (spotifyResponse.statusCode == 200) {
      final data = SpotifySavedTracksResponse.fromJson(spotifyResponse.data!);
      items.addAll(data.tracks);
    }
    tracksLeft = 0;
  } while (tracksLeft > 0);

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
  static const authorization = 'Authorization';
  static const limitQuery = 'limit';

  static const contentTypeHeader = {'Content-Type': 'application/json'};
  static const baseUrl = 'https://api.spotify.com';
  static const path = '/v1/me/tracks';
  static const defaultLimit = 20;
  static const maxLimit = 50;
}
