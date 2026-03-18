import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class SmallSliderBarWidget extends StatelessWidget {
  final bool isFull;
  const SmallSliderBarWidget({super.key, required this.isFull});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: 24.5.w),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                width: 152.5.w,
                child: Divider(
                  radius: BorderRadius.circular(16.sp),
                  thickness: 6.sp,
                  color: Color(0xff0088FF),
                ),
              ),
              const HightSpacing(hight: 20),
              Text('contact', style: AppTextStyles.black16w400),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: 152.5.w,
                child: Divider(
                  radius: BorderRadius.circular(16.sp),
                  thickness: 6.sp,
                  color: isFull ? Color(0xff0088FF) : Color(0xff787878),
                ),
              ),
              const HightSpacing(hight: 20),
              Text('Details', style: AppTextStyles.black16w400),
            ],
          ),
        ],
      ),
    );
  }
}
