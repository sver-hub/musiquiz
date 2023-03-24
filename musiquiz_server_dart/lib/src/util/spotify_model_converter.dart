import 'package:models/models.dart';
import 'package:models/server_models.dart';

extension SpotifyTrackX on SpotifyTrackResponse {
  Track get asTrack => Track(
        id: id,
        name: name,
        artists: artists.map((e) => e.asSimpleArtist).toList(),
        album: album.asAlbum,
      );
}

extension SpotifyTrackArtistX on SpotifyTrackArtist {
  SimpleArtist get asSimpleArtist => SimpleArtist(id: id, name: name);
}

extension SpotifyTrackAlbumX on SpotifyAlbum {
  Album get asAlbum => Album(id: id, name: name, images: images);
}

extension SpotifyAlbumsTrackX on SpotifyAlbumsTrack {
  Track asTrack(Album album) => Track(
        id: id,
        name: name,
        artists: artists.map((e) => e.asSimpleArtist).toList(),
        album: album,
      );
}

extension SpotifyAlbumsArtistX on SpotifyAlbumsArtist {
  SimpleArtist get asSimpleArtist => SimpleArtist(id: id, name: name);
}

extension SpotifyArtistX on SpotifyArtistResponse {
  Artist get asArtist => Artist(id: id, name: name, images: images);

  SimpleArtist get asSimpleArtist => SimpleArtist(id: id, name: name);
}
