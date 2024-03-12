import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_wars_app/internal/components/app_routes.dart';
import 'package:video_player/video_player.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    final user = FirebaseAuth.instance.currentUser;

    super.initState();
    Timer(const Duration(seconds: 4), () {
      if (user != null) {
        context.go(RouterConstants.movieScreen);
      } else {
        context.go('/auth');
      }
    });
    _controller = VideoPlayerController.asset('assets/videos/video1.mp4')
      ..initialize().then(
        (_) {
          // Гарантируем, что видео начнется сразу после инициализации
          _controller.play();
          // Гарантируем, что видео будет проигрываться в цикле
          _controller.setLooping(true);
          // Обновляем состояние, когда видео готово к воспроизведению
          setState(() {});
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? SizedBox(
                // Заполнение всего экрана
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
