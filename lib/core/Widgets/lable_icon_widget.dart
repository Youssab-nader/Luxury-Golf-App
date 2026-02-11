import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LableIcon extends StatelessWidget {
  final LinearGradient gradientColor;
  final String svgIconPath;
  const LableIcon({
    super.key,
    required this.gradientColor,
    required this.svgIconPath,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        gradient: gradientColor,

        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SvgPicture.asset(svgIconPath),
    );
  }
}
