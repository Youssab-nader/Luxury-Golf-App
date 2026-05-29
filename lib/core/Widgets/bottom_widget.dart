import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/app_colors.dart';
import '../styles/app_styles.dart';

class BottomWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double bottomWidth;
  final double bottomHight;
  final String? svgIconPath;
  final double? r;
  final double? spacing;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const BottomWidget({
    super.key,
    required this.text,
    required this.bottomWidth,
    required this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.spacing,
    required this.bottomHight,
    this.r,
    this.svgIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: (svgIconPath != null) ? SvgPicture.asset(svgIconPath!) : SizedBox(),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.blue155,
        foregroundColor: foregroundColor ?? Colors.white,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(r?.r ?? 8.r),
        ),
        minimumSize: Size(bottomWidth.w, bottomHight.h),
        // elevation: 20,
      ),
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: spacing ?? 0,
        children: [Text(text, style: AppTextStyles.bottomTextStyle)],
      ),
    );
  }
}
