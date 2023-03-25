import 'package:dart_frog/dart_frog.dart';
import 'package:musiquiz_server_dart/src/models/server_response.dart';
import 'package:musiquiz_server_dart/src/parsers/header_parser.dart';
import 'package:musiquiz_server_dart/src/parsers/query_parser.dart';
import 'package:musiquiz_server_dart/src/service/music_data_service.dart';

Future<Response> onRequest(RequestContext context) async {
  const searchTermQueryKey = 'q';
  const searchTypeQueryKey = 'type';
  const acceptableSearchTypes = ['track', 'artist', 'album'];

  final request = context.request;
  final accessToken = HeaderParser.parseAuthorizationBearer(request.headers);
  if (accessToken == null) {
    return ServerResponse.spotifyAuth401();
  }

  final searchTerm = request.getQueryString(searchTermQueryKey);
  final searchType = request.getQueryString(searchTypeQueryKey);
  if (searchTerm == null) {
    return ServerResponse.error400('Missing search term');
  }
  if (searchType != null && !acceptableSearchTypes.contains(searchType)) {
    return ServerResponse.error400('Invalid search type');
  }

  final musicDataService = MusicDataService.create(accessToken);

  final response = await musicDataService.search(
    searchTerm: searchTerm,
    searchType: searchType ?? acceptableSearchTypes.join(','),
  );

  return ServerResponse.json(body: response.toJson());
}
