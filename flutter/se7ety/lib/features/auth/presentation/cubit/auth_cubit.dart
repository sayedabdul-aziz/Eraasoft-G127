import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/firebase/firestore_services.dart';
import 'package:se7ety/core/services/shared_pref.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/auth/data/models/patient_model.dart';
import 'package:se7ety/features/auth/data/models/user_enum.dart';
import 'package:se7ety/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String emailAddress, String password) async {
    emit(AuthLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      User? user = credential.user;

      SharedPref.saveUserId(user?.uid ?? '');
      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthErrorState('لا يوجد مستخدم مسجل بهذا البريد الإلكتروني'));
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState('كلمة المرور غير صحيحة'));
      } else {
        emit(AuthErrorState('حدث خطأ أثناء تسجيل الدخول'));
      }
    }
    emit(AuthSuccessState());
  }

  Future<void> register(
    UserTypeEnum userType,
    String name,
    String emailAddress,
    String password,
  ) async {
    emit(AuthLoadingState());
    try {
      var userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      User? user = userCredential.user;
      user?.updateDisplayName(name);
      // store user date in Firestore
      if (userType == UserTypeEnum.doctor) {
        await FirestoreServices.createDoctor(
          DoctorModel(
            name: name,
            uid: user?.uid ?? '',
            email: emailAddress,
            rating: 3,
          ),
        );
      } else {
        await FirestoreServices.createPatient(
          PatientModel(name: name, uid: user?.uid ?? '', email: emailAddress),
        );
      }

      SharedPref.saveUserId(user?.uid ?? '');
      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState('كلمة المرور ضعيفة جداً'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState('البريد الإلكتروني مستخدم بالفعل'));
      } else {
        emit(AuthErrorState('حدث خطأ أثناء التسجيل'));
      }
    } catch (e) {
      emit(AuthErrorState('حدث خطأ غير متوقع'));
    }
  }

  Future<void> registerDoctorData(DoctorModel model) async {
    emit(AuthLoadingState());
    try {
      await FirestoreServices.updateDoctor(model);
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState('حدث خطأ أثناء تسجيل بيانات الطبيب'));
    }
  }
}
