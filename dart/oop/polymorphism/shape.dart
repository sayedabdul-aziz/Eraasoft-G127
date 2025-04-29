abstract class Shape {
  double d1;
  Shape(this.d1);
  void getArea();
}

class Circle implements Shape {
  @override
  double d1;
  Circle(this.d1);

  @override
  void getArea() {}
}

class Rectangle extends Shape {
  double d2;
  Rectangle(super.d1, this.d2);

  @override
  void getArea() {
    print('Area is ${d1 * d2}');
  }
}
