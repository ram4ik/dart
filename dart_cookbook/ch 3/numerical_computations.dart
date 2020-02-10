import 'dart:math';

void main() {
  int points = 42; // starts as a smi
  print(points); // 42
  points = pow(points, 10); // becomes a mint
  print(points); // 17080198121677824
  points = pow(points, 3); // becomes a bigint
  print(points); // 498286030598279113099971926747682862196213573224
}