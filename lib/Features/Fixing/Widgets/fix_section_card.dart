import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

// ignore: must_be_immutable
class FixSectionCard extends StatefulWidget {
  final String svgPicPath;
  final String cardText;

  FixSectionCard({super.key, required this.svgPicPath, required this.cardText});
  bool isTaped = false;
  @override
  State<FixSectionCard> createState() => _FixSectionCardState();
}

class _FixSectionCardState extends State<FixSectionCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 172.w,
        height: 88.h,
        padding: EdgeInsets.fromLTRB(13.w, 13.h, 0, 0),
        decoration: BoxDecoration(
          color: widget.isTaped ? AppColors.blueEFF : AppColors.white,
          border: Border.all(color:widget.isTaped ? AppColors.blue155 : AppColors.grey676, width: 1.6.r),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              widget.svgPicPath,
              colorFilter: ColorFilter.mode(
                widget.isTaped ? AppColors.blue155 : AppColors.grey4A5,
                BlendMode.srcIn,
              ),
            ),
            const HightSpacing(hight: 3),
            Text(
              widget.cardText,
              style: AppTextStyles.blue101w400s16.copyWith(
                fontSize: 14.sp,
                color: widget.isTaped ? AppColors.blue155 : AppColors.blue101,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          widget.isTaped = !widget.isTaped;
        });
      },
    );
  }
}
