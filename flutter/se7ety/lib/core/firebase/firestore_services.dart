import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se7ety/core/services/shared_pref.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/auth/data/models/patient_model.dart';
import 'package:se7ety/features/patient/booking/data/appointment_model.dart';

class FirestoreServices {
  static late final FirebaseFirestore _firestore;
  static late final CollectionReference _doctorsCollection;
  static late final CollectionReference _patientsCollection;
  static late final CollectionReference _appointmentsCollection;

  static void init() {
    _firestore = FirebaseFirestore.instance;
    _doctorsCollection = _firestore.collection("doctors");
    _patientsCollection = _firestore.collection("patients");
    _appointmentsCollection = _firestore.collection("appointments");
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

  static Future<void> updatePatient(PatientModel model) async {
    await _patientsCollection.doc(model.uid).update(model.toUpdateData());
  }

  static Future<DocumentSnapshot<Object?>> getPatientProfileById() async {
    return _patientsCollection.doc(SharedPref.getUserId()).get();
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

  static Future<void> createAppointment(AppointmentModel model) async {
    await _appointmentsCollection.doc().set(model.toJson());
  }

  static Future<QuerySnapshot<Object?>> getPatientAppointment() async {
    return _appointmentsCollection
        .where('patientID', isEqualTo: SharedPref.getUserId())
        .orderBy('date', descending: false)
        .get();
  }

  static Future<QuerySnapshot<Object?>> getDoctorAppointment() async {
    return _appointmentsCollection
        .where('doctorID', isEqualTo: SharedPref.getUserId())
        .orderBy('date', descending: false)
        .get();
  }

  static Future<void> deleteAppointment(String docID) async {
    return _appointmentsCollection.doc(docID).delete();
  }
}
