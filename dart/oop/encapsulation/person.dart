class Person {
  int? _age;

  set age(int age) {
    if (age > 0) {
      this._age = age;
    } else {
      print('Invalid age');
    }
  }

  int get age => this._age ?? 0;
}
