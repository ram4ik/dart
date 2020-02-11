

main() {
  var name = 'Bob';
  dynamic name2 = 'Bob';
  String name3 = 'Bob';

  var number = 42;
  printInteger(number);

  int lineCount;
  assert(lineCount == null);
}

void printInteger(int number) {
  print('The number is $number');
}