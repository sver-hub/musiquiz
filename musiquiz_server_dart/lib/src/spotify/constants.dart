abstract class SpotifyApiConstants {
  static const baseUrl = 'https://api.spotify.com/v1';
  static const savedTracksPath = '/me/tracks';
  static const savedTracksContainPath = '/me/tracks/contains';
  static const artistPath = '/artists/{id}';
  static const albumPath = '/albums/{id}';
  static const artistsAlbumsPath = '/artists/{id}/albums';
  static const albumsTracksPath = '/albums/{id}/tracks';
  static const searchPath = '/search';

  static const queryLimit = 'limit';
  static const queryOffset = 'offset';
  static const queryIncludeGroups = 'include_groups';
  static const queryMarket = 'market';
  static const queryIds = 'ids';
  static const querySearchTerm = 'q';
  static const querySearchType = 'type';

  static const queryValueIncludeGroups = 'album,single';
  static const queryValueMarket = 'UA';
}
