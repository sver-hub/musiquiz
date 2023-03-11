import 'package:dart_frog/dart_frog.dart';
import 'package:dio/dio.dart' hide Response;

Future<Response> onRequest(RequestContext context) async {
  final accessToken = context.request.uri.queryParameters['access_token'];

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.spotify.com',
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    ),
  );

  final tracks = await dio.get<Map<String, dynamic>>('/v1/me/tracks');

  return Response(body: '$tracks');
}
