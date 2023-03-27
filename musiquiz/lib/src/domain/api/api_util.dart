import 'constants.dart';

class ApiUtil {
  static Map<String, String> createAuthHeader(String spotifyAccessToken) =>
      {Header.authorization: '${Header.bearer} $spotifyAccessToken'};
}
