void main() {

  var p = new Person();
  p.name = "Joe";

  if (p is Person) {
    print('p is called ${p.name}');
    print('p is of type ${p.runtimeType}');
  } else {
    // p has value null and is of type Null
    print('p has value $p and is of type ${p.runtimeType}'); }
}

class Person {
  String name;
}
