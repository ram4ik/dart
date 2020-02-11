import 'dart:io';
import 'package:http/http.dart' as http;

main() {
  var url = Uri.parse('https://dart.dev');
  http.get(url).then((response) {
    new File('dart.txt').writeAsBytes(response.bodyBytes);
  });

  print(url.toString());
}
