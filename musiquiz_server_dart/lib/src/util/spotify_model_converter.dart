import 'package:models/models.dart';
import 'package:models/server_models.dart';

extension SpotifyTrackX on SpotifyTrack {
  Track get asTrack => Track(
        id: id,
        name: name,
        artists: artists.map((e) => e.asArtistSimple).toList(),
        album: album.asAlbum,
      );
}

extension SpotifyTrackArtistX on SpotifyArtistSimple {
  ArtistSimple get asArtistSimple => ArtistSimple(id: id, name: name);
}

extension SpotifyTrackAlbumX on SpotifyAlbum {
  Album get asAlbum => Album(
        id: id,
        name: name,
        images: images,
        artists: artists.map((e) => e.asArtistSimple).toList(),
      );
}

extension SpotifyAlbumsTrackX on SpotifyAlbumsTrack {
  Track asTrack(Album album) => Track(
        id: id,
        name: name,
        artists: artists.map((e) => e.asArtistSimple).toList(),
        album: album,
      );
}

extension SpotifyArtistX on SpotifyArtistResponse {
  Artist get asArtist => Artist(id: id, name: name, images: images);
}
