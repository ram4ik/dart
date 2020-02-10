class Person {
  String name;
  num salary;

  Person(this.name, {this.salary});
}

class ImmutableSquare {
  final num length;
  static final ImmutableSquare ONE = const ImmutableSquare(1);

  const ImmutableSquare(this.length);
}

main() {
  var sv = new Service('Credit Card Validation');
  sv.serve('Validate card number');
  Person p = new Person("S. Flutters");
  print(p); // S. Flutters

  // factory as a default implementation of an abstract class:
  Cat cat = new Animal();
  var catSound = cat.makeNoise();
  print(catSound); // Meow
}

class Service {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to the _ in front of its name.
  static final Map<String, Service> _cache = <String, Service>{};

  Service._internal(this.name);

  factory Service(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final serv = new Service._internal(name);
      _cache[name] = serv;
      return serv;
    }
  }

  void serve(String msg) {
    if (!mute) {
      print(msg); // Validate card number
    }
  }
}

class Person2 {
  factory Person2(name) => new Teacher(name);
}

class Teacher implements Person2 {
  String name;
  Teacher(this.name);
  toString() => name;
}

abstract class Animal {
  String makeNoise();
  factory Animal() => new Cat();
}

class Cat implements Animal { String makeNoise() => 'Meow'; }
class Dog implements Animal { String makeNoise() => 'Woef';}