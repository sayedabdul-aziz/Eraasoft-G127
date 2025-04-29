void main() {
  // display('Ahmed', 26, 'Male');
  display1('Amira', 33, 'Female');
  display3(age: 34, name: 'Amr');
  display4('Amr', gender: 'Male', age: 34);
}

//1) positional  (sorting, required)
void display(String name, int age, String gender) {
  print('name: $name, age: $age, gender: $gender');
}

//2) positional  (sorting, required and optional)
void display1(String name, int age, [String gender = 'Male']) {
  print('name: $name, age: $age, gender: $gender');
}

//3) Named  (not sorting, required)
void display2(
    {required String name, required int age, required String gender}) {
  print('name: $name, age: $age, gender: $gender');
}

//4) Named  (not sorting, required and optional)
void display3(
    {required String name, required int age, String gender = 'Male'}) {
  print('name: $name, age: $age, gender: $gender');
}

//5) Named  (not sorting, required and optional)
void display4(String name, {required int age, String gender = 'Male'}) {
  print('name: $name, age: $age, gender: $gender');
}
