typedef Headers = Map<String, String>;

class HeaderParser {
  static const _authorization = 'Authorization';
  static const _bearer = 'Bearer';
  static const _contentType = 'Content-Type';
  static const _applicationJson = 'application/json';

  static String? parseAuthorizationBearer(Headers headers) {
    final tokens = headers[_authorization]?.split(' ');
    if (tokens == null) {
      return null;
    }
    final bearerIndex = tokens.indexOf(_bearer);
    if (bearerIndex >= 0 && bearerIndex + 1 < tokens.length) {
      return tokens[bearerIndex + 1];
    } else {
      return null;
    }
  }

  static Headers createAuthorizationBearer(String token) =>
      {_authorization: '$_bearer $token'};

  static Headers createContentTypeJson() => {_contentType: _applicationJson};
}
