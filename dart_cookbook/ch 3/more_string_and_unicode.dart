import 'dart:convert';

String str = "Acción"; // Spanish for 'Action'

void main() {
  List<int> encoded = utf8.encode(str);
  print(encoded); // [65, 99, 99, 105, 195, 179, 110]
  // The UTF8 code units are reinterpreted as
  // Latin-1 code points (a subset of Unicode code points).
  // String latin1String = new String.fromCharCodes(encoded);
  // print(latin1String);
  // AcciÃ3n
  // print(latin1String.codeUnits);
  // [65, 99, 99, 105, 195, 179, 110]
  var string = utf8.decode(encoded);
  print(string); // Acción
}