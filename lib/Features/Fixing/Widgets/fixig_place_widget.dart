import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

// ignore: must_be_immutable
class FixingPlace extends StatelessWidget {
  final String mainText;
  final String subText;
  final String svgPath;
  final bool isSelected;
  final VoidCallback onTap;
   const FixingPlace({
    super.key,
    required this.mainText,
    required this.subText,
    required this.svgPath,
    required this.onTap,
    required this.isSelected,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.only(left: 14.w, top: 11.2.h),
            width: 345.w,
            height: 75.h,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.blueEFF : AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                width: 1.6.r,
                color:
                    isSelected ? AppColors.blue155 : AppColors.greyADA,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(svgPath),
                WidthSpacing(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mainText, style: AppTextStyles.blue101w400s16),
                    Text(subText, style: AppTextStyles.grey4A5w400s14),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
