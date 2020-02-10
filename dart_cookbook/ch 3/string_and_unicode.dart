String country = "Egypt";
String city = "Zürich";
String japanese = "日本語"; // nihongo meaning 'Japanese'

void main() {
  print('Unicode escapes: \uFE18'); // the ⎕ symbol
  print(country[0]);
  print(country.codeUnitAt(0));
  print(country.codeUnits);
  print(country.runes.toList());
  print(new String.fromCharCode(69)); // E
  print(new String.fromCharCodes([69, 103, 121, 112, 116]));
  print(city[1]);
  print(city.codeUnitAt(1));
  print(city.codeUnits);
  print(city.runes.toList());
  print(new String.fromCharCode(252)); // ü
  print(new String.fromCharCodes([90, 252, 114, 105, 99, 104])); //
  print(japanese[0]);
  print(japanese.codeUnitAt(0));
  print(japanese.codeUnits);
  print(japanese.runes.toList());
  print(new String.fromCharCode(35486)); // 語
  print(new String.fromCharCodes([26085, 26412, 35486]));

}