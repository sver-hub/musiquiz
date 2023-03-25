import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';

class ServerResponse {
  /// Create a [Response] with a string body.
  static Response string({
    int statusCode = 200,
    String? body,
    Map<String, Object>? headers,
    Encoding? encoding,
  }) =>
      Response(
        statusCode: statusCode,
        body: body,
        headers: headers,
        encoding: encoding,
      );

  /// Create a [Response] with a byte array body.
  static Response bytes({
    int statusCode = 200,
    List<int>? body,
    Map<String, Object>? headers,
  }) =>
      Response.bytes(statusCode: statusCode, body: body, headers: headers);

  /// Create a [Response] with a json encoded body.
  static Response json({
    int statusCode = 200,
    Object? body = const <String, dynamic>{},
    Map<String, Object> headers = const <String, Object>{},
  }) =>
      Response.json(statusCode: statusCode, body: body, headers: headers);

  static Response spotifyAuth401() =>
      Response(statusCode: 401, body: 'Missing spotify access token');

  static Response error400(String message) =>
      Response(statusCode: 400, body: message);
}
