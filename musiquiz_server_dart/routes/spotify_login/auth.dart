import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  const clienId = '3d2b127e03d84d57a40d75c65e44783f';
  const responseType = 'code';
  const scopes = ['user-library-read'];
  const redirectUri = 'http://127.0.0.1:8080/spotify_login/token';

  final uri = Uri(
    scheme: 'HTTPS',
    host: 'accounts.spotify.com',
    path: '/authorize',
    queryParameters: {
      'client_id': clienId,
      'response_type': responseType,
      'scope': scopes.join(' '),
      'redirect_uri': redirectUri,
    },
  );

  return Response(statusCode: 303, headers: {'Location': '$uri'});
}
