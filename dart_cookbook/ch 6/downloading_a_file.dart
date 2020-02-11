import 'dart:html';

main() {
  HttpRequest.getString('https://dart.dev')
      .then(processString)
      .catchError(print);
}

processString(str) {
  print(str);
}
