import 'package:dart_frog/dart_frog.dart';

typedef Query = Map<String, String>;

extension RequestQueryParser on Request {
  String? getQueryString(String key) => uri.queryParameters[key];

  bool getQueryBool(String key) => uri.queryParameters[key] == 'true';
}
