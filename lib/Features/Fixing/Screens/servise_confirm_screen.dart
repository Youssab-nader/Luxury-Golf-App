import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luxury_golf_app/Features/Fixing/Controllers/fix_service_controller.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';
import 'package:provider/provider.dart';

class CheckOutRepairConfirm extends StatefulWidget {
  const CheckOutRepairConfirm({super.key});

  @override
  State<CheckOutRepairConfirm> createState() => _CheckOutRepairConfirmState();
}

class _CheckOutRepairConfirmState extends State<CheckOutRepairConfirm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FixServiceController>(
      builder: (
        BuildContext context,
        FixServiceController controller,
        Widget? child,
      ) {
        final String expProblemsNames = controller.request.expProblems!
            .map((problem) {
              return problem.problemName;
            })
            .toList()
            .join(', ');
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
                  // height: 196.h,
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
                      Text(
                        'Request Summary',
                        style: AppTextStyles.grey4A5w400s14,
                      ),
                      const HightSpacing(hight: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Customer:',
                            style: AppTextStyles.grey4A5w400s14,
                          ),
                          Text(
                            controller.request.customerName ?? 'Null',
                            style: AppTextStyles.grey4A5w400s14.copyWith(
                              color: AppColors.blue101,
                            ),
                          ),
                        ],
                      ),
                      const HightSpacing(hight: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Phone Number:',
                            style: AppTextStyles.grey4A5w400s14,
                          ),
                          Text(
                            controller.request.customerPhoneNum ?? 'Null',
                            style: AppTextStyles.grey4A5w400s14.copyWith(
                              color: AppColors.blue101,
                            ),
                          ),
                        ],
                      ),
                      const HightSpacing(hight: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Problem Section:',
                            style: AppTextStyles.grey4A5w400s14,
                          ),
                          Text(
                            maxLines: 1,
                            expProblemsNames ,
                            style: AppTextStyles.grey4A5w400s14.copyWith(
                              color: AppColors.blue101,
                              
                            ),
                          ),
                        ],
                      ),
                      const HightSpacing(hight: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Car Model:',
                            style: AppTextStyles.grey4A5w400s14,
                          ),
                          Text(
                            
                            controller.request.carModel ?? 'Null' ,
                            style: AppTextStyles.grey4A5w400s14.copyWith(
                              color: AppColors.blue101,
                              
                            ),
                          ),
                        ],
                      ),

                    
                      // Text(
                      //   controller.request.problemsDesc ?? 'Null',
                      //   style: AppTextStyles.blue101w400s16,
                      // ),
                      // Text(
                      //   expProblemsNames,
                      //   style: AppTextStyles.blue101w400s16,
                      // ),
                      // Text(
                      //   controller.request.reqDate ?? 'Null',
                      //   style: AppTextStyles.blue101w400s16,
                      // ),
                      // Text(
                      //   controller.request.reqServiceLocation ?? 'Null',
                      //   style: AppTextStyles.blue101w400s16,
                      // ),

                        // Text(
                      //   controller.request.reqId,
                      //   style: AppTextStyles.blue101w400s16,
                      // ),
                      // Text(
                      //   controller.request.status ?? 'Null',
                      //   style: AppTextStyles.blue101w400s16,
                      // ),

                      // Text(
                      //   controller.request.carModel ?? 'Null',
                      //   style: AppTextStyles.blue101w400s16,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
