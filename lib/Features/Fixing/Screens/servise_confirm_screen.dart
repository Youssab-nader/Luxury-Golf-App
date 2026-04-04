import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class CheckOutRepairConfirm extends StatelessWidget {
  const CheckOutRepairConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.fromLTRB(26.w, 56.h, 10.w, 0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset('assets/icons/true_icon.svg')),
            const HightSpacing(hight: 16),
            Text('Request Submitted!', style: AppTextStyles.blue101w400s16),
            const HightSpacing(hight: 5.8),
            Text(
              'Thank you! Your repair request has \n     been submitted successfully.',
              style: AppTextStyles.grey4A5w400s14,
            ),
            const HightSpacing(hight: 16),
            Container(
              width: 304.8.w,
              height: 196.h,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Request Summary', style: AppTextStyles.blue101w400s16),
                  Row(children: []),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
