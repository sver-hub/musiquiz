abstract class BaseUrl {
  static const url = 'http://localhost:8080';
}

abstract class Path {
  static const savedTracks = '/saved_tracks';
}

abstract class Query {
  static const limit = 'limit';
}

abstract class Header {
  static const authorization = 'Authorization';
  static const bearer = 'Bearer';
}