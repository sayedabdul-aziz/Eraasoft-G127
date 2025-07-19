import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/auth/data/models/patient_model.dart';

class FirestoreServices {
  static late final FirebaseFirestore _firestore;
  static late final CollectionReference _doctorsCollection;
  static late final CollectionReference _patientsCollection;

  static void init() {
    _firestore = FirebaseFirestore.instance;
    _doctorsCollection = _firestore.collection("doctors");
    _patientsCollection = _firestore.collection("patients");
  }

  static Future<void> createDoctor(DoctorModel model) async {
    await _doctorsCollection.doc(model.uid).set(model.toJson());
  }

  static Future<void> updateDoctor(DoctorModel model) async {
    await _doctorsCollection.doc(model.uid).update(model.toUpdateData());
  }

  static Future<void> createPatient(PatientModel model) async {
    await _patientsCollection.doc(model.uid).set(model.toJson());
  }

  static Future<QuerySnapshot<Object?>> sortDoctorsByRating() async {
    return _doctorsCollection.orderBy('rating', descending: true).get();
  }

  static Future<QuerySnapshot<Object?>> getDoctorsBySpecialization(
    String specialization,
  ) async {
    return _doctorsCollection
        .where('specialization', isEqualTo: specialization)
        .get();
  }

  static Future<QuerySnapshot<Object?>> getDoctorsByName(String name) async {
    return _doctorsCollection.orderBy('name').startAt([name.trim()]).endAt([
      '${name.trim()}\uf8ff',
    ]).get();
  }
}
