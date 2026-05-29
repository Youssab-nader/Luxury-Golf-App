import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/core/Widgets/arrow_back_widget.dart';
import 'package:luxury_golf_app/core/Widgets/service_categories_card.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';

class ServiceFirstScreen extends StatefulWidget {
  final String topImagePath;
  final String svgImagePath;
  final String mainText;
  final String subText;
  final LinearGradient mainIconColor;
  final String navScreenName;

  const ServiceFirstScreen({
    super.key,
    required this.topImagePath,
    required this.svgImagePath,
    required this.mainText,
    required this.subText,
    required this.mainIconColor,
    required this.navScreenName,
  });

  @override
  State<ServiceFirstScreen> createState() => _ServiceFirstScreenState();
}

class _ServiceFirstScreenState extends State<ServiceFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  widget.topImagePath,
                  width: double.infinity,
                  height: 256.h,
                  fit: BoxFit.fill,
                ),
                Positioned(top: 15, left: 8, child: ArrowBack()),
              ],
            ),

            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(24.w, 69.h, 12.w, 80.h),
              child: Column(
                children: [
                  ServiceCategoryCard(
                    gradientColor: widget.mainIconColor,
                    mainText: widget.mainText,
                    subText: widget.subText,
                    svgIconPath: widget.svgImagePath,
                    cardWidth: 339,
                    onTap: () {
                      context.pushNamed(widget.navScreenName);
                    },
                  ),
                  const HightSpacing(hight: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServiceCategoryCard(
                        gradientColor: AppColors.green3101,
                        mainText: 'Pending service',
                        subText: ' Pending services',
                        svgIconPath: 'assets/icons/pinding_icon.svg',
                        cardWidth: 165,
                        onTap: () {
                          context.pushNamed(AppRouts.fixPindingServices);
                        },
                      ),
                      ServiceCategoryCard(
                        gradientColor: AppColors.orangeFFF5,
                        mainText: 'Service History',
                        subText: ' past repairs',
                        svgIconPath: 'assets/icons/history_Icon.svg',
                        cardWidth: 165,
                        onTap: () {
                          context.pushNamed(AppRouts.fixHistory);
                        },
                      ),
                    ],
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
