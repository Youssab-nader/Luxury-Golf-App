import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class DataCardWidget extends StatelessWidget {
  final String text;
  final String number;
  const DataCardWidget({super.key, required this.text, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: 101.w,
      height: 84.h,
      decoration: BoxDecoration(
        color: AppColors.white.withAlpha(40),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Text(text, style: AppTextStyles.blueE7Fw400s14),
          Text(
            number,
            style: AppTextStyles.blue0A9w400s20.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
