import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  return Response(
    body: '''
<!DOCTYPE html>
<html>
  <head>
    <title>Authenticating Spotify</title>
  </head>
  <body>
	<p>Please wait while we authenticate Spotify...</p>
	<script type="text/javascript">
		if(window.opener) {
			window.opener.postMessage('?' + window.location.href.split('?')[1], "*");
		} else {
			window.close();
		}
	</script>
  </body>
</html>
''',
    headers: {'content-type': 'text/html;charset=utf-8'},
  );
}
