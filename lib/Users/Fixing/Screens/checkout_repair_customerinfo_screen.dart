import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/Users/Fixing/Widgets/fixig_place_widget.dart';
import 'package:luxury_golf_app/core/Widgets/buttom_widget.dart';
import 'package:luxury_golf_app/core/Widgets/small_slider_bar_widget.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/Widgets/text_field_widget.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styling/app_colors.dart';
import 'package:luxury_golf_app/core/styling/app_fonts.dart';
import 'package:luxury_golf_app/core/styling/app_styles.dart';

// ignore: must_be_immutable
class CheckOutRepairCustomerInfo extends StatefulWidget {
  CheckOutRepairCustomerInfo({super.key});
  int selectedIndex = 0;
  @override
  State<CheckOutRepairCustomerInfo> createState() =>
      _CheckOutRepairCustomerInfoState();
}

final GlobalKey<FormState> _key = GlobalKey<FormState>();

class _CheckOutRepairCustomerInfoState
    extends State<CheckOutRepairCustomerInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(11.w, 57.h, 7.w, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Text(
                  "Golf Cart Repair Request",
                  style: AppTextStyles.blue101w400s16.copyWith(
                    fontFamily: AppFonts.seconFont,
                  ),
                ),
                const HightSpacing(hight: 8),
                Text(
                  "Fill out the form below to request repair service for your golf cart.",
                  style: AppTextStyles.grey4A5w400s14,
                ),
                const HightSpacing(hight: 16),
                Center(child: SizedBox(width: 305.w, child: Divider())),
                const HightSpacing(hight: 16),
                SmallSliderBarWidget(isFull: false),
                const HightSpacing(hight: 16),
                Text(
                  'Customer Information',
                  style: AppTextStyles.blue101w400s16,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(7.w, 16.h, 7.w, 16.h),
                  height: 348.h,
                  width: 345.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.r,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextFieldWidget(
                        labelText: 'Full name',
                        hintText: 'Youssab Nander Gamil',
                        hight: 48,
                      ),
                      TextFieldWidget(
                        labelText: 'Phone number',
                        hintText: '0121234567',
                        hight: 48,
                      ),
                      TextFieldWidget(
                        labelText: 'Email address',
                        hintText: 'example@gmail.com',
                        hight: 48,
                      ),
                    ],
                  ),
                ),
                const HightSpacing(hight: 11),
                FixingPlace(
                  mainText: 'fix in our work station',
                  subText: 'you will send it in our work station',
                  svgPath: 'assets/icons/trans_car_icon.svg',
                  isSelected: widget.selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      widget.selectedIndex = 0;
                    });
                  },
                ),
                const HightSpacing(hight: 16),
                FixingPlace(
                  mainText: 'fix at your Home',
                  subText: 'we will fix the car at your home',
                  svgPath: 'assets/icons/home_icon_(coloredborders)_icon.svg',
                  isSelected: widget.selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      widget.selectedIndex = 1;
                    });
                  },
                ),
                const HightSpacing(hight: 18),
                Center(
                  child: ButtomWidget(
                    text: 'Continue',
                    buttomWidth: 310,
                    buttomhight: 44,
                    onPressed: () {
                      if (_key.currentState?.validate() ?? false) {
                        context.pushNamed(AppRouts.checkOutRepairDetails);
                      }
                    },
                  ),
                ),
                const HightSpacing(hight: 19),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
