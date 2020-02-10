class Immortal {
  static final Immortal theOne = new Immortal._internal('Connor MacLeod');
  String name;
  factory Immortal(name) => theOne; // private, named constructor
  Immortal._internal(this.name);
}


main() {
    var im1 = new Immortal('Juan Ramirez');
    var im2 = new Immortal('The Kurgan');
    print(im1.name);
    print(im2.name);
    print(Immortal.theOne.name);
    assert(identical(im1, im2));
}

class Singleton {
  factory Singleton() => const Singleton._internal_();
  const Singleton._internal_();
}