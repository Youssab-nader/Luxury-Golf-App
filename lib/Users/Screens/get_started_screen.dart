
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styling/app_styles.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(40.w, 46.h, 0, 0),
              child: Text(
                'Wheels on \nDemand',
                style: AppTextStyles.headLineText,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(40.w, 0, 0, 0),
              child: Text(
                'Reliable partners for renting, maintenance, \nand selling Golf cars',
                style: AppTextStyles.subBlueText,
              ),
            ),
            Image.asset(
              'assets/images/get_started_golf_car.png',
              width: 375.w,
              height: 342.h,
            ),
            SizedBox(
              width: 375.w,
              height: 269.h,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/get_started.svg',
                    width: 375.w,
                    height: 269.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 52.37.h,
                    left: 34.4.w,
                    child: SvgPicture.asset(
                      'assets/images/white_circle.svg',
                      width: 160.w,
                      height: 162.h,
                    ),
                  ),
                  Positioned(
                    top: 95.h,
                    left: 60.w,
                    child: InkWell(
                      child: SizedBox(
                        width: 120.w,
                        height: 80.h,
                        child: Text(
                          'Get \nStarted',
                          style: AppTextStyles.getStartedTex,
                        ),
                      ),
                      onTap: () {
                        context.pushReplacementNamed(AppRouts.login);
                        // GoRouter.of(
                        //   context,
                        // ).pushReplacementNamed(AppRouts.homePage);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
