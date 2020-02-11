main() {

  print(int.parse('42'));

  print('42'.parseInt());

  print('42'.padLeft(5));
  print('42'.padRight(5));

  var v = '89';
  print(v.parseInt());

  //
  print(42.plusSeven());
}

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}

extension SomeWildName on int {
  int plusSeven() {
    return this + 7;
  }
}