import 'package:models/models.dart';

import '../models/tracks_with_lyrics.dart';
import '../musixmatch/musixmatch_api.dart';
import '../spotify/spotify_api.dart';

class TracksService {
  final SpotifyApi _spotifyApi;
  final MusixmatchApi _musixmatchApi;

  TracksService(this._spotifyApi, this._musixmatchApi);

  Future<Iterable<TrackWithLyrics>> getRandomTracks(int numberOfTracks) async {
    final spotifyTracks = await _spotifyApi.getRandomTracks(numberOfTracks);

    final tracksWithLyrics = await Future.wait(
      spotifyTracks.map(_getLyricsForTrack),
    );

    return tracksWithLyrics.where((track) => track.lyrics != null);
  }

  Future<TrackWithLyrics> _getLyricsForTrack(Track track) async {
    final response = await _musixmatchApi.getLyrics(
      trackName: track.name,
      artistName: track.artists.first.name,
    );
    return TrackWithLyrics(track, response.lyrics);
  }
}
