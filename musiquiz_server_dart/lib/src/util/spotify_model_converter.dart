import 'package:models/models.dart';
import 'package:models/server_models.dart';

extension SpotifyTrackX on SpotifyTrack {
  Track get asTrack => Track(
        id: id,
        name: name,
        artists: artists.map((e) => e.asSimpleArtist).toList(),
        album: album.asSimpleAlbum,
      );
}

extension SpotifyTrackArtistX on SpotifyTrackArtist {
  SimpleArtist get asSimpleArtist => SimpleArtist(id: id, name: name);
}

extension SpotifyTrackAlbumX on SpotifyTrackAlbum {
  SimpleAlbum get asSimpleAlbum => SimpleAlbum(id: id, name: name);
}

extension SpotifyAlbumsTrackX on SpotifyAlbumsTrack {
  Track asTrack(SimpleAlbum album) => Track(
        id: id,
        name: name,
        artists: artists.map((e) => e.asSimpleArtist).toList(),
        album: album,
      );
}

extension SpotifyAlbumsArtistX on SpotifyAlbumsArtist {
  SimpleArtist get asSimpleArtist => SimpleArtist(id: id, name: name);
}

extension SpotifyArtistsAlbumX on SpotifyArtistsAlbum {
  SimpleAlbum get asSimpleAlbum => SimpleAlbum(id: id, name: name);
}
