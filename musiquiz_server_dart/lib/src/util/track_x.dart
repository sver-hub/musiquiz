import 'package:models/models.dart';

extension TrackX on Track {
  Track withLyrics(String? lyrics) => Track(
        id: id,
        name: name,
        artists: artists,
        album: album,
        lyrics: lyrics,
      );
}
