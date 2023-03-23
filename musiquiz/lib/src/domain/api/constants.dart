abstract class BaseUrl {
  static const url = 'http://localhost:8080';
}

abstract class Path {
  static const savedTracks = '/saved_tracks';
  static const guessByLyrics = '/guess_by_lyrics_quiz';
  static const search = '/search';
}

abstract class Query {
  static const limit = 'limit';
  static const searchTerm = 'q';
  static const searchType = 'type';
}

abstract class Header {
  static const authorization = 'Authorization';
  static const bearer = 'Bearer';
}
