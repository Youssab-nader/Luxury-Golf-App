import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styling/app_colors.dart';
import 'package:luxury_golf_app/core/styling/app_styles.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  bool homeTaped = true;
  bool inboxTaped = false;
  bool profileTaped = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 90.h,
          width: 375.w,
          decoration: BoxDecoration(color: AppColors.white),
        ),
        Row(
          children: [
            WidthSpacing(width: 40),
            InkWell(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      homeTaped
                          ? 'assets/icons/home_icon_colored.svg'
                          : 'assets/icons/home_icon.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                    HightSpacing(hight: 5),
                    Text(
                      'Home',
                      style:
                          homeTaped
                              ? AppTextStyles.grey585w500s10.copyWith(
                                color: AppColors.blue044,
                              )
                              : AppTextStyles.grey585w500s10,
                    ),
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  inboxTaped = false;
                  profileTaped = false;
                  homeTaped = !homeTaped;
                });
              },
            ),
            WidthSpacing(width: 90),
            InkWell(
              child: SizedBox(
                width: 40.w,
                height: 90.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      inboxTaped
                          ? 'assets/icons/inbox_icon_ina.svg'
                          : 'assets/icons/inbox_icon_dis.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                    HightSpacing(hight: 5),
                    Text(
                      'Favorite',
                      style:
                          inboxTaped
                              ? AppTextStyles.grey585w500s10.copyWith(
                                color: AppColors.blue044,
                              )
                              : AppTextStyles.grey585w500s10,
                    ),
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  inboxTaped = !inboxTaped;
                  homeTaped = false;
                  profileTaped = false;
                });
              },
            ),
            WidthSpacing(width: 90),
            InkWell(
              child: SizedBox(
                width: 40.w,
                height: 90.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      profileTaped
                          ? 'assets/icons/profile_icon_colored.svg'
                          : 'assets/icons/profile_icon.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                    HightSpacing(hight: 5),
                    Text(
                      'Profile',
                      style:
                          profileTaped
                              ? AppTextStyles.grey585w500s10.copyWith(
                                color: AppColors.blue044,
                              )
                              : AppTextStyles.grey585w500s10,
                    ),
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  profileTaped = !profileTaped;
                  inboxTaped = false;
                  homeTaped = false;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
