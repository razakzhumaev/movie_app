// import 'package:flutter/foundation.dart';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_wars_app/features/authorization/auth_screen.dart';
import 'package:star_wars_app/features/authorization/verify_email_screen.dart';
import 'package:star_wars_app/internal/components/app_routes.dart';

class FirebaseStream extends StatefulWidget {
  const FirebaseStream({super.key});

  @override
  State<FirebaseStream> createState() => _FirebaseStreamState();
}

class _FirebaseStreamState extends State<FirebaseStream> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 100), () {
      context.go(RouterConstants.movieScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text('Что-то пошло не так !'),
              ),
            );
          } else if (snapshot.hasData) {
            if (!snapshot.data!.emailVerified) {
              return const VerifyEmailScreen();
            }
            return const AuthScreen();
          } else {
            return const AuthScreen();
          }
        });
  }
}
