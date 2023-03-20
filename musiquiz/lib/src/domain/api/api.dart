import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:musiquiz/src/domain/api/api_util.dart';
import 'package:musiquiz/src/domain/api/constants.dart';
import 'package:musiquiz/src/domain/auth/spotify/spotify_access_token_holder.dart';
import 'package:musiquiz/src/util/dio_x.dart';

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

    final tracks = SavedTracksResponse.fromJson(response.requireData).items;
    return tracks;
  }

  Future<GuessByLyricsQuizResponse> getGuessByLyricsQuiz() async {
    final accessToken = _spotifyAccessTokenHolder.requireAccessToken;

    final response = await _dio.getJson(
      Path.guessByLyrics,
      options: Options(headers: ApiUtil.createAuthHeader(accessToken)),
    );

    return GuessByLyricsQuizResponse.fromJson(response.requireData);
  }
}
