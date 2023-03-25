import 'package:collection/collection.dart';
import 'package:models/models.dart';

import '../models/exceptions.dart';
import '../service/music_data_service.dart';

class GuessByLyricsQuiz {
  final MusicDataService _musicDataService;

  GuessByLyricsQuiz(this._musicDataService);

  Future<GuessByLyricsQuizResponse> createFromRandomSavedTracks({
    required int numberOfQuestions,
  }) async {
    final tracks = await _musicDataService.getRandomTracks(
      numberOfTracks: numberOfQuestions,
      withLyrics: true,
    );
    final items = tracks.map(_createQuizItem).toList();
    return GuessByLyricsQuizResponse(items);
  }

  Future<GuessByLyricsQuizResponse> createFromArtist({
    required int numberOfQuestions,
    required String artistId,
    bool onlySaved = true,
  }) async {
    final artistComplete = await _musicDataService.getArtistsComplete(
      artistId: artistId,
      onlySaved: onlySaved,
    );
    final availableTracks =
        artistComplete.albums.expand((album) => album.tracks);

    if (availableTracks.isEmpty) {
      throw ExternalQueryException('No saved tracks of this artist');
    }

    final selectedTracks = await _getSomeTracksWithLyrics(
      availableTracks,
      numberOfQuestions,
    );

    final items = selectedTracks.map(_createQuizItem).toList();
    return GuessByLyricsQuizResponse(items);
  }

  Future<GuessByLyricsQuizResponse> createFromAlbum({
    required int numberOfQuestions,
    required String albumId,
    bool onlySaved = true,
  }) async {
    final album = await _musicDataService.getAlbum(albumId: albumId);
    final albumComplete = await _musicDataService.getAlbumComplete(
      album: album,
      onlySaved: onlySaved,
    );

    final availableTracks = albumComplete.tracks;

    if (availableTracks.isEmpty) {
      throw ExternalQueryException('No saved tracks of this album');
    }

    final selectedTracks = await _getSomeTracksWithLyrics(
      availableTracks,
      numberOfQuestions,
    );

    final items = selectedTracks.map(_createQuizItem).toList();
    return GuessByLyricsQuizResponse(items);
  }

  Future<List<Track>> _getSomeTracksWithLyrics(
    Iterable<Track> allTracks,
    int howMany,
  ) async {
    final selectedTracks = <Track>[];

    final untestedTracks = allTracks.toSet();
    while (untestedTracks.isNotEmpty && selectedTracks.length < howMany) {
      final leftToAdd = howMany - selectedTracks.length;
      final sample = untestedTracks.sample(leftToAdd);
      untestedTracks.removeAll(sample);

      final tracksWithLyrics =
          await _musicDataService.getLyricsForTracks(sample);
      selectedTracks.addAll(tracksWithLyrics);
    }

    return selectedTracks;
  }

  GuessByLyricsQuizItem _createQuizItem(Track track) {
    return GuessByLyricsQuizItem(
      lyrics: track.lyrics!,
      trackName: track.name,
      albumName: track.album.name,
      artistNames: track.artists.map((e) => e.name).toList(),
    );
  }
}
