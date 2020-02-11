import 'dart:developer';
import 'dart:math';

main() {
  print(calculateRabbits(12));
}

String calculateRabbits(int years) {
  calc(years) => (2 * pow(years, years)).round().toInt();
  var out = "After $years years:\t ${calc(years)} animals";
  return out;
}


