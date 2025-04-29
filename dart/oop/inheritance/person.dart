// enum PaymentState {
//   pending(1),
//   paid(2),
//   failed(3),
//   canceled(4);

//   final int value;

//   const PaymentState(this.value);

//   PaymentState fromValue(int value) {
//     return PaymentState.values.firstWhere((element) => element.value == value);
//   }
// }

class Person {
  String? name;
  String? address;
  Person({this.name, this.address});

  void display() {
    print('I AM A PARENT CLASS');
  }
}

class Student extends Person {
  int? grade;

  Student({String? name, String? address, this.grade})
      : super(name: name, address: address);

  @override
  void display() {
    print('Name: $name, Address: $address, Grade: $grade');
  }
}

class Doctor extends Person {
  double? salary;

  Doctor({super.name, super.address, this.salary});

  @override
  void display() {
    print('Name: $name, Address: $address, Salary: $salary');
  }
}
