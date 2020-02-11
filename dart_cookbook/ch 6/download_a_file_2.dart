import 'dart:io';
import 'dart:convert';

var client;

main() {
  var url = Uri.parse('https://dart.dev');
  client = new HttpClient();
  client
      .getUrl(url)
      .then((HttpClientRequest req) => req.close())
      .then((HttpClientResponse resp) => writeToFile(resp));
}

writeToFile(resp) {
  resp.transform(utf8.decoder).toList().then((data) {
    var body = data.join('');
    var file = new File('dart.txt');
    file.writeAsString(body).then((_) {
      client.close();
    });
  });
}
