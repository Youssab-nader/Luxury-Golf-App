import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_golf_app/core/Widgets/lable_icon_widget.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class ServiceCategoryCard extends StatelessWidget {
  final LinearGradient gradientColor;
  final String mainText;
  final String subText;
  final String svgIconPath;
  final double cardWidth;
  final VoidCallback onTap;
  const ServiceCategoryCard({
    super.key,
    required this.gradientColor,
    required this.mainText,
    required this.subText,
    required this.svgIconPath,
    required this.cardWidth, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(22.w, 15.h, 22.w, 15.h),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: AppColors.grey8A8),
          borderRadius: BorderRadius.circular(16.r),
        ),
        width: cardWidth.w,
        height: 155.h,
        child: Column(
          children: [
            LableIcon(gradientColor: gradientColor, svgIconPath: svgIconPath),
            const HightSpacing(hight: 11.2),
            Text(mainText, style: AppTextStyles.blue044w400s16),
            Text(subText, style: AppTextStyles.subgreyText),
          ],
        ),
      ),
    );
  }
}
