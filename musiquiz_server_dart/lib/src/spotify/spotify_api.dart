import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:models/models.dart';
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
        );

  void init() {
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

  Future<int> _getTotatSavedTracks() async {
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

  Future<Iterable<int>> _generateRandomOffsets(int numberOfOffsets) async {
    final total = await _getTotatSavedTracks();

    if (numberOfOffsets >= total) {
      return Iterable.generate(total, (index) => index);
    }

    final random = Random();
    final result = <int>{};
    do {
      result.add(random.nextInt(total - 1));
    } while (result.length < numberOfOffsets);

    return result;
  }

  Future<List<Track>> _getTracks({
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

  Future<Track> _getTrackByOffset(int offset) async {
    final response = await _getTracks(limit: 1, offset: offset);
    return response.first;
  }

  Future<List<Track>> getRandomTracks(int numberOfTracks) async {
    final randomOffsets = await _generateRandomOffsets(numberOfTracks);

    // TODO optimize request for subsuqent offsets
    final requests = randomOffsets.map(_getTrackByOffset);
    //TODO add cleanup?
    return Future.wait(requests);
  }
}
