import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/Features/Fixing/Controllers/repair_screen_controller.dart';
import 'package:luxury_golf_app/Features/Fixing/Models/fix_service_model.dart';
import 'package:luxury_golf_app/Features/Fixing/Widgets/select_fixing_problem_widget.dart';
import 'package:luxury_golf_app/core/Widgets/buttom_widget.dart';
import 'package:provider/provider.dart';
import 'package:luxury_golf_app/core/Widgets/small_slider_bar_widget.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/Widgets/text_field_widget.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_fonts.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class CheckOutRepairDetails extends StatelessWidget {
  CheckOutRepairDetails({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SelectExpProblemsController(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Golf Cart Repair Request",
            style: AppTextStyles.blue101w400s16.copyWith(
              fontFamily: AppFonts.seconFont,
            ),
          ),
        ),
        // extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const HightSpacing(hight: 60),
                  Text(
                    "Fill out the form below to request repair service for your golf cart.",
                    style: AppTextStyles.grey4A5w400s14,
                  ),
                  const HightSpacing(hight: 16),
                  Center(child: SizedBox(width: 305.w, child: Divider())),
                  const HightSpacing(hight: 16),
                  SmallSliderBarWidget(isFull: true),
                  const HightSpacing(hight: 16),
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      'Repair Details',
                      style: AppTextStyles.textLable.copyWith(fontSize: 16.sp),
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      'Which Section Needs Fixing? *',
                      style: AppTextStyles.black16w400.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),

                  const HightSpacing(hight: 14),

                  SelectExpProblemsWidget(),

                  const HightSpacing(hight: 14),
                  TextFieldWidget(
                    labelText: 'Problem Description *',
                    maxLines: 5,
                    hintText:
                        'Please describe the issue in detail. What symptoms are you experiencing? When did it start?',
                    validationString: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please Enter Problem Description';
                      }
                      return null;
                    },
                  ),
                  const HightSpacing(hight: 16),
                  // Align(
                  //   alignment: AlignmentGeometry.centerLeft,
                  //   child: Text(
                  //     'Add Photos (Optional)',
                  //     style: AppTextStyles.textLable,
                  //   ),
                  // ),
                  // const HightSpacing(hight: 8),
                  // ImagePickerWidget(),
                  const HightSpacing(hight: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtomWidget(
                        text: 'Back',
                        buttomhight: 36.h,
                        buttomWidth: 155.w,
                        onPressed: () {
                          context.pop();
                        },
                        forgroundColor: AppColors.black,
                        backgroundColor: AppColors.white,
                      ),
                      ButtomWidget(
                        text: 'Submit',
                        buttomhight: 36.h,
                        buttomWidth: 155.w,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // TODO : Send Request to Employee
                            
                          }
                        },
                      ),
                    ],
                  ),
                  const HightSpacing(hight: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
