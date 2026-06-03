
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class ServiceCardWidget extends StatelessWidget {
  final String imagePath;
  final String svgIconPath;
  final VoidCallback onTap;
  final String serviceName;

  const ServiceCardWidget({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.serviceName,
    required this.svgIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Container(
            width: 260.w,
            height: 144.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyADA, width: 0),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              child: Image.asset(imagePath, fit: BoxFit.fill, height: 144.h),
            ),
          ),
        ),

        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: 48.h,
            width: 260.w,
            decoration: BoxDecoration(
              color: AppColors.greyF3F,
              border: Border.all(color: AppColors.greyADA, width: 1),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 6,
                  spreadRadius: -1,
                  color: Color.fromARGB(26, 0, 0, 0),
                ),
              ],
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16.r),
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(serviceName, style: AppTextStyles.blue0A9w400s20),
                WidthSpacing(width: 6),
                SvgPicture.asset(svgIconPath),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// // Stack(
//         children: [
//        
// GestureDetector(
//   onTap: () => context.pop(),
//   behavior: HitTestBehavior.opaque,
//   child: Padding(
//     padding: EdgeInsets.all(20.r),
//     child: SvgPicture.asset('assets/icons/back_icon.svg'),
//   ),
// )
//           Positioned(
//             top: 143.h,
//             child: Container(
//               alignment: Alignment.center,
//               height: 48.h,
//               width: 260.w,
//               decoration: BoxDecoration(
//                 color: AppColors.greyF3F,
//                 border: Border.all(color: AppColors.greyADA, width: 1),
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(0, 4),
//                     blurRadius: 6,
//                     spreadRadius: -1,
//                     color: Color.fromARGB(26, 0, 0, 0),
//                   ),
//                 ],
//                 borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(16.r),
//                 ),
//               ),

//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(serviceName, style: AppTextStyles.blue0A9w400s20),
//                   WidthSpacing(width: 6),
//                   SvgPicture.asset(svgIconPath),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),