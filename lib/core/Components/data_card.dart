import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class DataSelectionWidget extends StatelessWidget {
  final String labelText;
  final String selectionTitle;
  final Widget suffixWidget;
  const DataSelectionWidget({
    super.key,
    required this.labelText,
    required this.selectionTitle,
    required this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: AppTextStyles.textLable),
        HightSpacing(hight: 5),
        Container(
          height: 48.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.greyADA),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectionTitle,
                style: AppTextStyles.grey4A5w400s14.copyWith(
                  color: Color(0xff9CA3AF),
                  fontWeight: FontWeight.w600,
                ),
              ),
              suffixWidget,
            ],
          ),
        ),
      ],
    );
  }
}
