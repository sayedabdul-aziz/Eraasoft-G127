import 'person.dart';

void main() {
  Student student = Student(name: 'Sayed', address: 'Cairo', grade: 3);
  student.display();

  Doctor doctor = Doctor(name: 'Ahmed', address: 'Alex', salary: 10000.0);
  doctor.display();
}
