class MusixmatchMatcherLyricsGetResponse {
  final String? lyrics;
  final String? lyricsLanguage;

  MusixmatchMatcherLyricsGetResponse._({
    this.lyrics,
    this.lyricsLanguage,
  });

  factory MusixmatchMatcherLyricsGetResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    final message = json['message'] as Map<String, dynamic>?;
    final statusCode = message?['header']?['status_code'] as int?;
    if (statusCode != 200) {
      return MusixmatchMatcherLyricsGetResponse._();
    }
    final lyricsBlock = message!['body']?['lyrics'] as Map<String, dynamic>?;
    final lyricsText = lyricsBlock?['lyrics_body'] as String?;
    final lyricsLanguage = lyricsBlock?['lyrics_language'] as String?;

    if (lyricsText == null || lyricsText.isEmpty) {
      return MusixmatchMatcherLyricsGetResponse._();
    }

    final lyrics = lyricsText.replaceRange(
        lyricsText.indexOf('...\n\n*******'), lyricsText.length, '');

    return MusixmatchMatcherLyricsGetResponse._(
      lyrics: lyrics,
      lyricsLanguage: lyricsLanguage,
    );
  }
}
