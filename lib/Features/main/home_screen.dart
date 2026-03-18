import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/core/Widgets/navigation_bar_widget.dart';
import 'package:luxury_golf_app/core/Widgets/service_card_widget.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Map<String, dynamic> _userData = {};

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final pref = await SharedPreferences.getInstance();
    final userDataString = pref.getString('userData');
    _userData = jsonDecode(userDataString ?? '');
    print('User name  : ${_userData['name']}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(
                  right: 30.w,
                  left: 30.w,
                  top: 10.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome,',
                      style: AppTextStyles.grey585w500s10.copyWith(
                        color: Color(0xff6B7280),
                        fontWeight: FontWeight.w600,
                        fontSize: 17.sp,
                      ),
                    ),
                    Text(
                      _userData['name'] ?? '',
                      style: AppTextStyles.grey585w500s10.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue044,
                        fontSize: 17.sp,
                      ),
                    ),
                    Spacer(),
                    ClipOval(
                      child: Image.network(
                        _userData['photoURL'] ??
                            'https://imgs.search.brave.com/veKl8ET9WhanlBbihrKWBEkRfga_K4vtJ2gNSmAM1iE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/dmVjdG9yc3RvY2su/Y29tL2kvNTAwcC80/MS85MS9hdmF0YXIt/ZGVmYXVsdC11c2Vy/LXByb2ZpbGUtaWNv/bi1zaW1wbGUtZmxh/dC1ncmV5LXZlY3Rv/ci01NzIzNDE5MS5q/cGc',
                        height: 45.h,
                        width: 45.w,
                      ),
                    ),
                  ],
                ),
              ),
              HightSpacing(hight: 24),
              Text('Home', style: AppTextStyles.headLineText),
              HightSpacing(hight: 29),
              SizedBox(
                width: 344.w,
                height: 203.h,
                child: Row(
                  children: [
                    ServiceCardWidget(
                      onTap: () {
                        context.pushNamed(AppRouts.rent);
                      },
                      imagePath: 'assets/images/golf_car_service_card.jpg',
                      serviceName: 'Rent',
                      svgIconPath: 'assets/icons/golf_car_icon.svg',
                    ),
                    WidthSpacing(width: 8),
                    ServiceCardWidget(
                      onTap: () {
                        context.pushNamed(AppRouts.fix);
                      },
                      imagePath: 'assets/images/fix_man.jpg',
                      serviceName: 'Fix',
                      svgIconPath: 'assets/icons/fix_icon.svg',
                    ),
                  ],
                ),
              ),
              HightSpacing(hight: 5),
              SizedBox(
                width: 338.w,
                child: Divider(thickness: 1, color: AppColors.black),
              ),
             
              Spacer(),
              NavigationBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
