import 'package:bookia/features/auth/presentation/page/login_screen.dart';
import 'package:bookia/features/auth/presentation/page/register_screen.dart';
import 'package:bookia/features/home/data/model/best_seller_response/product.dart';
import 'package:bookia/features/home/presentation/page/book_details_screen.dart';
import 'package:bookia/features/intro/page/splash_screen.dart';
import 'package:bookia/features/intro/page/welcome_screen.dart';
import 'package:bookia/features/main/main_app_screen.dart';
import 'package:bookia/features/profile/presentation/page/edit_profile_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String main = '/main';
  static const String details = '/details';
  static const String editProfile = '/editProfile';

  static final GoRouter routers = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: welcome, builder: (context, state) => WelcomeScreen()),
      GoRoute(path: login, builder: (context, state) => LoginScreen()),
      GoRoute(path: register, builder: (context, state) => RegisterScreen()),
      GoRoute(path: main, builder: (context, state) => MainAppScreen()),
      GoRoute(
        path: details,
        builder: (context, state) {
          return BookDetailsScreen(product: state.extra as Product);
        },
      ),
      GoRoute(
        path: editProfile,
        builder: (context, state) => EditProfileScreen(),
      ),
    ],
  );
}
