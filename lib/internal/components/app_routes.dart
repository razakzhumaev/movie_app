import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_wars_app/features/authorization/auth_screen.dart';
import 'package:star_wars_app/features/authorization/splash/splash_screen2.dart';
import 'package:star_wars_app/features/authorization/splash/splash_screen.dart';
import 'package:star_wars_app/features/authorization/verify_email_screen.dart';
import 'package:star_wars_app/features/now_playing/presentation/screens/movie_screen.dart';
import 'package:star_wars_app/internal/helpers/firebase_stream.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const FirebaseStream();
      },
    ),
    GoRoute(
      path: RouterConstants.splash1,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RouterConstants.splash2,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen2();
      },
    ),
    GoRoute(
      path: RouterConstants.auth,
      builder: (BuildContext context, GoRouterState state) {
        return const AuthScreen();
      },
    ),
    GoRoute(
      path: RouterConstants.movieScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const MovieScreen();
      },
    ),
    GoRoute(
      path: RouterConstants.verifyEmailScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const VerifyEmailScreen();
      },
    ),
  ],
);

class RouterConstants {
  static String splash1 = '/splash1';
  static String splash2 = '/splash2';
  static String auth = '/auth';
  static String movieScreen = '/movie_screen';
  static String verifyEmailScreen = '/verify_email';
}
