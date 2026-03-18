import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_golf_app/Features/Auth/Sign_in/login_screen.dart';
import 'package:luxury_golf_app/core/routing/router_generation.dart';
import 'package:luxury_golf_app/core/styles/app_themes.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Luxury Golf Egypt ',
          theme: AppThemes.lightTheme,
          routerConfig: RouterGeneration.mainRoutingInApp,
        );
      },
      child: const LoginScreen(),
    );
  }
}
