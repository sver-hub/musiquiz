import 'package:dart_frog/dart_frog.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:models/models.dart';

Future<Response> onRequest(RequestContext context) async {
  final code = context.request.uri.queryParameters['code'];
  const authCode =
      'M2QyYjEyN2UwM2Q4NGQ1N2E0MGQ3NWM2NWU0NDc4M2Y6MWMyNjZiMWY0ODk1NDE2ZjllYjA5OTcwMzZkZDViNDk=';

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://accounts.spotify.com',
      headers: {
        'Authorization': 'Basic $authCode',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    ),
  );

  final response = await dio.post<Map<String, dynamic>>(
    '/api/token',
    data: {
      'code': code,
      'grant_type': 'authorization_code',
      'redirect_uri': 'http://127.0.0.1:8080/spotify_login/token'
    },
  );

  try {
    if (response.statusCode == 200) {
      final tokenResponse = SpotifyTokenResponse.fromJson(response.data!);
      final accessToken = tokenResponse.accessToken;

      return Response(
        statusCode: 303,
        headers: {
          'Location':
              'http://localhost:8080/saved_tracks?access_token=$accessToken',
        },
      );
    }

    return Response(
      statusCode: response.statusCode ?? 400,
      body: response.statusMessage,
    );
  } on DioError catch (e) {
    return Response(statusCode: 500, body: e.message);
  }
}
