import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:musiquiz/src/domain/api/constants.dart';
import 'package:musiquiz/src/domain/auth/spotify/spotify_access_token_holder.dart';
import 'package:musiquiz/src/util/dio_x.dart';

class Api {
  final SpotifyAccessTokenHolder _spotifyAccessTokenHolder;
  final dio = Dio(BaseOptions(baseUrl: BaseUrl.url));

  Api(this._spotifyAccessTokenHolder);

  Future<List<Track>> getSavedTracks() async {
    final accessToken = _spotifyAccessTokenHolder.accessToken;
    if (accessToken == null) {
      throw StateError('Call to getSavedTracks without access token');
    }

    final response = await dio.getJson(
      Path.savedTracks,
      queryParameters: {
        Query.limit: 50,
      },
      options: Options(
        headers: {
          Header.authorization: '${Header.bearer} $accessToken',
        },
      ),
    );

    final tracks = SavedTracksResponse.fromJson(response.requireData).items;
    return tracks;
  }
}
