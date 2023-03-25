import 'dart:math';

import 'package:collection/collection.dart';
import 'package:models/models.dart';
import 'package:models/server_models.dart';

import '../musixmatch/musixmatch_api.dart';
import '../spotify/spotify_api.dart';
import '../util/spotify_model_converter.dart';
import '../util/track_x.dart';

class MusicDataService {
  final SpotifyApi _spotifyApi;
  final MusixmatchApi _musixmatchApi;

  MusicDataService(this._spotifyApi, this._musixmatchApi);

  factory MusicDataService.create(String spotifyAccessToken) =>
      MusicDataService(SpotifyApi(spotifyAccessToken), MusixmatchApi());

  Future<Iterable<int>> _generateRandomOffsets(int numberOfOffsets) async {
    final total = await _spotifyApi.getTotatSavedTracks();

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

  Map<int, int> _createOffsetLimitMap(Iterable<int> offsets) {
    final sorted = offsets.toList()..sort();
    final result = <int, int>{};

    var limit = 0;
    for (var i = 0; i < sorted.length; i++) {
      final offset = sorted[i];
      if (result.containsKey(offset - limit)) {
        result[offset - limit] = ++limit;
        continue;
      }
      limit = 0;
      result[offset] = ++limit;
    }
    return result;
  }

  Future<List<SpotifyTrack>> _getRandomSavedTracks(
    int numberOfTracks,
  ) async {
    final randomOffsets = await _generateRandomOffsets(numberOfTracks);

    final offsetLimitMap = _createOffsetLimitMap(randomOffsets);
    final result = <SpotifyTrack>[];
    for (final entry in offsetLimitMap.entries) {
      result.addAll(
        await _spotifyApi.getSavedTracks(offset: entry.key, limit: entry.value),
      );
    }
    return result;
  }

  Future<Iterable<Track>> getRandomTracks({
    required int numberOfTracks,
    bool withLyrics = false,
  }) async {
    final spotifyTracks = await _getRandomSavedTracks(numberOfTracks);
    final tracks = spotifyTracks.map((spotifyTrack) => spotifyTrack.asTrack);

    if (!withLyrics) {
      return tracks;
    }

    return getLyricsForTracks(tracks);
  }

  Future<Iterable<Track>> getLyricsForTracks(Iterable<Track> tracks) async {
    final tracksWithLyrics = <Track>[];
    for (final track in tracks) {
      tracksWithLyrics.add(await getLyricsForTrack(track));
    }

    return tracksWithLyrics.where((track) => track.lyrics != null);
  }

  Future<Track> getLyricsForTrack(Track track) async {
    final response = await _musixmatchApi.getLyrics(
      trackName: track.name,
      artistName: track.artists.first.name,
    );
    return track.withLyrics(response.lyrics);
  }

  Future<List<Track>> _filterSavedOnly(List<Track> tracks) async {
    final ids = tracks.map((e) => e.id).toList();
    final isSavedList = await _spotifyApi.checkIfTrackAreSaved(ids);

    final filtered = <Track>[];
    for (var i = 0; i < min(isSavedList.length, tracks.length); i++) {
      if (isSavedList[i]) {
        filtered.add(tracks[i]);
      }
    }
    return filtered;
  }

  Future<Album> getAlbum({required String albumId}) async {
    final spotifyAlbum = await _spotifyApi.getAlbum(albumId);
    return spotifyAlbum.asAlbum;
  }

  Future<AlbumComplete> getAlbumComplete({
    required Album album,
    bool onlySaved = false,
  }) async {
    final tracksResponse = await _spotifyApi.getAllTracksOfAlbum(album.id);
    var tracks = tracksResponse.items.map(
      (spotifyTrack) => spotifyTrack.asTrack(album),
    );

    if (onlySaved) {
      tracks = await _filterSavedOnly(tracks.toList());
    }

    return AlbumComplete(
      id: album.id,
      name: album.name,
      images: album.images,
      artists: album.artists,
      tracks: tracks.toList(),
    );
  }

  Future<ArtistComplete> getArtistsComplete({
    required String artistId,
    bool onlySaved = false,
  }) async {
    final albumsResponse = await _spotifyApi.getAllAlbumsOfArtist(artistId);
    final albums = albumsResponse.items;

    final albumsWithTracks = <AlbumComplete>[];
    for (final album in albums) {
      final albumComplete = await getAlbumComplete(
        album: album.asAlbum,
        onlySaved: onlySaved,
      );
      if (albumComplete.tracks.isNotEmpty) {
        albumsWithTracks.add(albumComplete);
      }
    }
    final artistResponse = await _spotifyApi.getArtist(artistId);
    return ArtistComplete(
      id: artistId,
      name: artistResponse.name,
      albums: albumsWithTracks.whereNotNull().toList(),
      images: artistResponse.images,
    );
  }

  Future<SearchResponse> search({
    required String searchTerm,
    required String searchType,
  }) async {
    final response = await _spotifyApi.search(
      searchTerm: searchTerm,
      type: searchType,
    );
    final tracks = response.tracks?.items.map((e) => e.asTrack).toList();
    final artists = response.artists?.items.map((e) => e.asArtist).toList();
    final albums = response.albums?.items.map((e) => e.asAlbum).toList();

    return SearchResponse(
      tracks: tracks ?? [],
      artists: artists ?? [],
      albums: albums ?? [],
    );
  }
}
