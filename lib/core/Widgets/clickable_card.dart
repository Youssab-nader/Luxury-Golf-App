import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styling/app_styles.dart';

class ClickableCardWidget extends StatelessWidget {
  final String mainText;
  final String subTex;
  final String svgPath;
  final Color bordersColor;
  final Color containerColor;
  final Color iconColor;
  final VoidCallback onPress;

  const ClickableCardWidget({
    super.key,
    required this.mainText,
    required this.subTex,
    required this.svgPath,
    required this.bordersColor,
    required this.containerColor,
    required this.iconColor,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(16.8.r),
        height: 81.6.h,
        width: 343.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: bordersColor),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(11.2.r),
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: bordersColor),
              ),
              child: SvgPicture.asset(svgPath),
            ),
            const WidthSpacing(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mainText, style: AppTextStyles.blue101w400s16),
                Text(subTex, style: AppTextStyles.grey4A5w400s14),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: iconColor, size: 20.r),
            // SvgPicture.asset('assets/icons/arrow_go_icon.svg'),
          ],
        ),
      ),
    );
  }
}
