class Embrace {

  num _strength;

  num get strength => _strength;

  set strength(num value) => _strength = value;

  Embrace(this._strength);

  Embrace.light() : _strength = 3;

  Embrace.strangle() : _strength = 100;

  Embrace operator +(Embrace other) => new Embrace(strength + other.strength);

  String toString() => "Embraceometer reads $strength";

  Map toJson() => {'strength': '$_strength'};

  withAffection() {
    for (var no = 0; no <= 3; no++) {
      for (var s = 0; s <= 5; s++) {
        strength = s;
      }
    }
  }
}
