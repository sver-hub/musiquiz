import 'package:dio/dio.dart';
import 'package:models/models.dart';

import '../../util/dio_x.dart';
import '../auth/spotify/spotify_access_token_holder.dart';
import 'api_util.dart';
import 'constants.dart';

class Api {
  final SpotifyAccessTokenHolder _spotifyAccessTokenHolder;
  final _dio = Dio(BaseOptions(baseUrl: BaseUrl.url));

  Api(this._spotifyAccessTokenHolder);

  Future<List<Track>> getSavedTracks() async {
    final accessToken = _spotifyAccessTokenHolder.requireAccessToken;

    final response = await _dio.getJson(
      Path.savedTracks,
      options: Options(
        headers: ApiUtil.createAuthHeader(accessToken),
      ),
    );

    return SavedTracksResponse.fromJson(response.requireData).items;
  }

  Future<GuessByLyricsQuizResponse> getGuessByLyricsQuiz() async {
    final accessToken = _spotifyAccessTokenHolder.requireAccessToken;

    final response = await _dio.getJson(
      Path.guessByLyrics,
      options: Options(headers: ApiUtil.createAuthHeader(accessToken)),
    );

    return GuessByLyricsQuizResponse.fromJson(response.requireData);
  }

  Future<SearchResponse> search({
    required String searchTerm,
    required String? searchType,
  }) async {
    final accessToken = _spotifyAccessTokenHolder.requireAccessToken;

    final response = await _dio.getJson(
      Path.search,
      options: Options(headers: ApiUtil.createAuthHeader(accessToken)),
      queryParameters: {
        Query.searchTerm: searchTerm,
        if (searchType != null) Query.searchType: searchType,
      },
    );

    return SearchResponse.fromJson(response.requireData);
  }
}
