import 'dart:io';

void main() {
  var message = "Dart is Fun!";
  int i = 0;
  while (true) {
    print(message);
    i++;
    if (i == 10) {
      print("That's enought!");
      exit(10);
    }
  }
}