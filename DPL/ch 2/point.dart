import 'dart:math';

class Point {
  var x, y;

  Point(this.x, this.y);

  scale(factor) => new Point(x * factor, y * factor);

  operator +(p) => new Point(x + p.x, y + p.y);

  static distance(p1, p2) {
    var dx = p1.x - p2.x;
    var dy = p1.y - p2.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {

  var p = new Point(12, 42);

  var pScale = p.scale(2);

  var d = Point.distance(p, pScale);

  print(d);
}