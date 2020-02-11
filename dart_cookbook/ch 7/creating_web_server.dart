import 'dart:io';

//Define host and port:
InternetAddress HOST = InternetAddress.loopbackIPv6;
const int PORT = 8080;

main() {
  // Starting the web server:
  HttpServer.bind(HOST, PORT)
    .then((server) {
      print('server starts listening on port ${server.port}');
      // Starting the request handler:
      server.listen(handleRequest);
  })
  .catchError(print);
}

handleRequest(HttpRequest req) {
  print('request coming in');
  req.response
    ..headers.contentType = new ContentType("text", "plain", charset: "utf-8")
    ..write(' I heard you loud and clear.')
    ..write(' Send me the data!')
    ..close();
}