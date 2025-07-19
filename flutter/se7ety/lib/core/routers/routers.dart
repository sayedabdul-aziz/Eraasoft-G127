import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/auth/data/models/user_enum.dart';
import 'package:se7ety/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ety/features/auth/presentation/page/doctor_registeration_screen.dart';
import 'package:se7ety/features/auth/presentation/page/login_screen.dart';
import 'package:se7ety/features/auth/presentation/page/register_screen.dart';
import 'package:se7ety/features/intro/onboarding/onboarding_screen.dart';
import 'package:se7ety/features/intro/splash/splash_screen.dart';
import 'package:se7ety/features/intro/welcome/welcome_screen.dart';
import 'package:se7ety/features/patient/home/presentation/page/home_search_view.dart';
import 'package:se7ety/features/patient/home/presentation/page/specialization_search_screen.dart';
import 'package:se7ety/features/patient/main/nav_bar.dart';
import 'package:se7ety/features/patient/search/page/doctor_profile_view.dart';

class Routes {
  static const String splash = '/';
  static const String onboardingRoute = '/onboardingRoute';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String doctorRegisterForm = '/doctorRegisterForm';
  static const String patientMainApp = '/patientMainApp';
  static const String specializationSearch = '/specializationSearch';
  static const String doctorNameSearch = '/doctorNameSearch';
  static const String doctorProfile = '/doctorProfile';

  static final GoRouter routers = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(
        path: onboardingRoute,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(path: welcome, builder: (context, state) => WelcomeScreen()),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(userType: state.extra as UserTypeEnum),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: RegisterScreen(userType: state.extra as UserTypeEnum),
        ),
      ),
      GoRoute(
        path: doctorRegisterForm,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: DoctorRegistrationScreen(),
        ),
      ),
      GoRoute(
        path: patientMainApp,
        builder: (context, state) => PatientMainAppScreen(),
      ),
      GoRoute(
        path: specializationSearch,
        builder: (context, state) =>
            SpecializationSearchScreen(specialization: state.extra as String),
      ),
      GoRoute(
        path: doctorNameSearch,
        builder: (context, state) =>
            DoctorNameSearchScreen(searchKey: state.extra as String),
      ),
      GoRoute(
        path: doctorProfile,
        builder: (context, state) =>
            DoctorProfile(doctorModel: state.extra as DoctorModel?),
      ),
    ],
  );
}
