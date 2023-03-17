import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:models/server_models.dart';

import '../parsers/header_parser.dart';
import '../util/dio_x.dart';
import 'constants.dart';

class SpotifyApi {
  final String accessToken;
  final Dio _dio;

  int? _totalSavedTracks;
  bool _initialized = false;

  SpotifyApi(this.accessToken)
      : _dio = Dio(
          BaseOptions(
            baseUrl: SpotifyApiConstants.baseUrl,
            headers: {
              ...HeaderParser.createAuthorizationBearer(accessToken),
              ...HeaderParser.createContentTypeJson(),
            },
          ),
        ) {
    _init();
  }

  void _init() {
    if (_initialized) {
      return;
    }
    _dio.interceptors.add(
      RetryInterceptor(
        dio: _dio,
        logPrint: print,
        retries: 2,
        retryDelays: const [Duration(seconds: 1), Duration(seconds: 2)],
      ),
    );
    _initialized = true;
  }

  Future<int> getTotatSavedTracks() async {
    if (_totalSavedTracks != null) {
      return _totalSavedTracks!;
    }

    final response = await _dio.getJson(
      SpotifyApiConstants.savedTracksPath,
      queryParameters: {SpotifyApiConstants.queryLimit: 1},
    );

    final data = SpotifySavedTracksResponse.fromJson(response.data!);
    return _totalSavedTracks = data.total;
  }

  Future<List<SpotifyTrack>> getSavedTracks({
    required int limit,
    required int offset,
  }) async {
    final response = await _dio.getJson(
      SpotifyApiConstants.savedTracksPath,
      queryParameters: {
        SpotifyApiConstants.queryLimit: limit,
        SpotifyApiConstants.queryOffset: offset
      },
    );

    final data = SpotifySavedTracksResponse.fromJson(response.data!);
    return data.tracks;
  }

  Future<SpotifyArtistsAlbumsResponse> getAllAlbumsOfArtist(
    String artistId,
  ) async {
    final response = await _dio.getJson(
      SpotifyApiConstants.artistsAlbumsPath.replaceFirst('{id}', artistId),
      queryParameters: {
        SpotifyApiConstants.queryIncludeGroups:
            SpotifyApiConstants.queryValueIncludeGroups,
        SpotifyApiConstants.queryMarket: SpotifyApiConstants.queryValueMarket,
        SpotifyApiConstants.queryLimit: 50,
      },
    );

    return SpotifyArtistsAlbumsResponse.fromJson(response.data!);
  }

  Future<SpotifyAlbumsTracksResponse> getAllTracksOfAlbum(
    String albumId,
  ) async {
    final response = await _dio.getJson(
      SpotifyApiConstants.albumsTracksPath.replaceFirst('{id}', albumId),
      queryParameters: {
        SpotifyApiConstants.queryMarket: SpotifyApiConstants.queryValueMarket,
        SpotifyApiConstants.queryLimit: 50,
      },
    );

    return SpotifyAlbumsTracksResponse.fromJson(response.data!);
  }

  Future<SpotifyArtistResponse> getArtist(
    String artistId,
  ) async {
    final response = await _dio.getJson(
      SpotifyApiConstants.artistPath.replaceFirst('{id}', artistId),
    );

    return SpotifyArtistResponse.fromJson(response.data!);
  }

  Future<List<bool>> checkIfTrackAreSaved(List<String> trackIds) async {
    final slices = trackIds.slices(50);
    final result = <bool>[];
    for (final ids in slices) {
      final response = await _dio.get<List<dynamic>>(
        SpotifyApiConstants.savedTracksContainPath,
        queryParameters: {SpotifyApiConstants.queryIds: ids.join(',')},
      );
      result.addAll(response.data!.cast<bool>());
    }

    return result;
  }
}
