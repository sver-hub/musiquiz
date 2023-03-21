import 'package:dart_frog/dart_frog.dart';
import 'package:musiquiz_server_dart/src/parsers/header_parser.dart';
import 'package:musiquiz_server_dart/src/parsers/query_parser.dart';
import 'package:musiquiz_server_dart/src/service/music_data_service.dart';

Future<Response> onRequest(RequestContext context) async {
  const searchTermQueryKey = 'q';
  const searchTypeQueryKey = 'type';
  const acceptableSearchTypes = ['track', 'artist'];

  final request = context.request;
  final accessToken = HeaderParser.parseAuthorizationBearer(request.headers);
  if (accessToken == null) {
    return Response(statusCode: 400, body: 'Missing spotify access token');
  }

  final searchTerm = request.getQueryString(searchTermQueryKey);
  final searchType = request.getQueryString(searchTypeQueryKey);
  if (searchTerm == null) {
    return Response(statusCode: 400, body: 'Missing search term');
  }
  if (searchType != null && !acceptableSearchTypes.contains(searchType)) {
    return Response(statusCode: 400, body: 'Invalid search type');
  }

  final musicDataService = MusicDataService.create(accessToken);

  final response = await musicDataService.search(
    searchTerm: searchTerm,
    searchType: searchType ?? acceptableSearchTypes.join(','),
  );

  return Response.json(body: response.toJson());
}
