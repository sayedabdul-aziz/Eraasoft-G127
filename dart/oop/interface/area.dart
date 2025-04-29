abstract class Area {
  getArea();
}

abstract class Perimeter {
  getPerimeter();
}

class Circle implements Area, Perimeter {
  double radius;
  Circle(this.radius);

  @override
  getArea() {
    return 3.14 * radius * radius;
  }

  @override
  getPerimeter() {
    return 2 * 3.14 * radius;
  }
}
