import 'package:dio/dio.dart';
import 'package:models/server_models.dart';

import '../util/dio_x.dart';
import 'constants.dart';

class MusixmatchApi {
  static const _apiKey = 'e0d285379414d45c3b115eea43120438';

  Future<MusixmatchMatcherLyricsGetResponse> getLyrics({
    required String trackName,
    required String artistName,
  }) async {
    final dio = Dio(BaseOptions(baseUrl: MusixmatchApiConstants.baseUrl));

    final response = await dio.getJson(
      MusixmatchApiConstants.matcherLyricsGetPath,
      queryParameters: {
        MusixmatchApiConstants.queryApiKey: _apiKey,
        MusixmatchApiConstants.queryTrackName: trackName,
        MusixmatchApiConstants.queryArtistName: artistName,
      },
    );

    return MusixmatchMatcherLyricsGetResponse.fromJson(response.data!);
  }
}
