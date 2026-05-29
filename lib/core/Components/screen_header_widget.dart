import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class ScreenHeaderWidget extends StatelessWidget {
  final String mainText;
  final String subText;
  final Color color;

  const ScreenHeaderWidget({
    super.key,
    required this.mainText,
    required this.subText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      color: color,
      width: MediaQuery.of(context).size.width.w,
      height: 88.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          WidthSpacing(width: 12.w),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mainText, style: AppTextStyles.whiteFFFw400s24),
                Text(subText, style: AppTextStyles.blueE7Fw400s14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
