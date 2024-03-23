import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_wars_app/internal/components/routes/auto_route.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen> {
  @override
  void initState() {
    final user = FirebaseAuth.instance.currentUser;

    super.initState();
    Timer(const Duration(milliseconds: 3500), () {
      if (user != null) {
        AutoRouter.of(context).replace(const MovieRoute());
      } else {
        AutoRouter.of(context).replace(const AuthRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/videos/netflix_intro.gif',
          height: 1.sh,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
