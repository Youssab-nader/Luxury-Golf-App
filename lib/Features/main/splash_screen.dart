import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: InkWell(
          child: Image.asset(
            'assets/images/Logo.png',
            width: 300.w,
            height: 300.h,
          ),
          onTap: () {
            context.pushNamed(AppRouts.adminsHome);
          },
        ),
      ),
    );
  }
}
