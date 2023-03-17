typedef Query = Map<String, String>;

abstract class QueryParser {
  static String? parseArtistId(Query query) => query['artist_id'];

  static bool parseOnlySaved(Query query) => query['only_saved'] == 'true';

  static bool parseWithLyrics(Query query) => query['with_lyrics'] == 'true';
}
