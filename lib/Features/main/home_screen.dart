import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/Features/main/home_controller.dart';
import 'package:luxury_golf_app/core/Widgets/service_card_widget.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (
        BuildContext context,
        HomeController controller,
        Widget? child,
      ) {
        return Center(
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
                      controller.user.getFirstName(),
                      style: AppTextStyles.grey585w500s10.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue044,
                        fontSize: 17.sp,
                      ),
                    ),
                    Spacer(),
                    ClipOval(
                      child:
                          (controller.user.photoURL == null)
                              ? SvgPicture.asset(
                                'assets/images/def_user_image.svg',
                                height: 45.h,
                                width: 45.w,
                              )
                              : Image.network(
                                controller.user.photoURL!,
                                height: 45.h,
                                width: 45.w,
                              ),
                    ),
                  ],
                ),
              ),
              HightSpacing(hight: 24),
              Text('Home', style: AppTextStyles.headLineText),
              HightSpacing(hight: 16),
              ServiceCardWidget(
                onTap: () {
                  context.pushNamed(AppRouts.adminsHome);
                },
                imagePath: 'assets/images/rent_service_card.png',
                serviceName: 'Rent',
                svgIconPath: 'assets/icons/golf_car_icon.svg',
              ),
              HightSpacing(hight: 69),
              ServiceCardWidget(
                onTap: () {
                  context.pushNamed(AppRouts.fix);
                },
                imagePath: 'assets/images/fix_man.jpg',
                serviceName: 'Fix',
                svgIconPath: 'assets/icons/fix_icon.svg',
              ),
              HightSpacing(hight: 5),
            ],
          ),
        );
      },
    );
  }
}
