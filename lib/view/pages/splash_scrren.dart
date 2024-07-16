import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: const Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(
                "assets/images/splash.png",
              ),
              height: 400,
            ),
          ),
        ],
      ),
    );
  }
}
