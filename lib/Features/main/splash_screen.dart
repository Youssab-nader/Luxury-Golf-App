import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigation();
  }

  void _navigation() async {
    await Future.delayed(Duration(seconds: 5));
    if (!mounted) return;
    context.goNamed(AppRouts.getSrarted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset('assets/images/Splash.png', fit: BoxFit.cover),
      ),
    );
  }
}
