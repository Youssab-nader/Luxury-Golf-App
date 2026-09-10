import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luxury_golf_app/core/Components/data_card.dart';
import 'package:luxury_golf_app/core/Config/months_config.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';

import 'package:luxury_golf_app/core/styles/app_fonts.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class DateOfRentingScreen extends StatefulWidget {
  const DateOfRentingScreen({super.key});

  @override
  State<DateOfRentingScreen> createState() => _DateOfRentingScreenState();
}

class _DateOfRentingScreenState extends State<DateOfRentingScreen> {
  DateTime? startDate;
  DateTime? endDate;
  int? totalDays;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Rental Period",
          style: AppTextStyles.blue101w400s16.copyWith(
            fontFamily: AppFonts.secondFont,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(11.w, 0, 7.w, 0),
          child: Column(
            children: [
              Text(
                "Choose your rental dates and start time to see available carts",
                style: AppTextStyles.grey4A5w400s14,
              ),

              const HightSpacing(hight: 10),
              Container(
                padding: EdgeInsets.fromLTRB(7.w, 16.h, 7.w, 16.h),

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Rental Dates ',
                      style: AppTextStyles.bottomTextStyle,
                    ),
                    const HightSpacing(hight: 10),
                    DataSelectionWidget(
                      labelText: 'Start Date',
                      selectionTitle:
                          (startDate != null)
                              ? startDate!.toIso8601String().split('T').first
                              : 'Choose your session  Date',
                      suffixWidget: GestureDetector(
                        onTap: () {
                          _showStartDatePicker();
                        },
                        child: SvgPicture.asset('assets/icons/date_icon.svg'),
                      ),
                    ),
                    HightSpacing(hight: 16),
                    DataSelectionWidget(
                      labelText: 'End Date',
                      selectionTitle:
                          (endDate != null)
                              ? endDate!.toIso8601String().split('T').first
                              : 'Choose your session  Date',
                      suffixWidget: GestureDetector(
                        onTap: () {
                          _showEndDatePicker();
                        },
                        child: SvgPicture.asset('assets/icons/date_icon.svg'),
                      ),
                    ),
                    const HightSpacing(hight: 21),
                    Container(
                      width: 333.w,
                      height: 85.h,
                      padding: EdgeInsetsGeometry.all(12.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey8A8),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'From : ',
                                style: AppTextStyles.grey4A5w400s14,
                              ),
                              WidthSpacing(width: 2),
                              Text(
                                (startDate != null)
                                    ? '${startDate!.day} ${MonthsConfig.fromNumberToMonth(startDate!.month)} '
                                    : ' ',
                                style: AppTextStyles.blue044w400s16.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              WidthSpacing(width: 120),
                              Text(
                                'To : ',
                                style: AppTextStyles.grey4A5w400s14,
                              ),
                              WidthSpacing(width: 2),
                              Text(
                                (endDate != null)
                                    ? '${endDate!.day} ${MonthsConfig.fromNumberToMonth(endDate!.month)}'
                                    : ' ',
                                style: AppTextStyles.blue044w400s16.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: SizedBox(width: 309.w, child: Divider()),
                          ),
                          Row(
                            children: [
                              Text(
                                'Total : ',
                                style: AppTextStyles.grey4A5w400s14,
                              ),
                              WidthSpacing(width: 2),
                              Text(
                                (endDate != null && startDate != null)
                                    ? (totalDays! > 1)
                                        ? '$totalDays days'
                                        : '$totalDays day'
                                    : ' ',
                                style: AppTextStyles.blue044w400s16.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              HightSpacing(hight: 18),
              Container(
                padding: EdgeInsetsDirectional.all(16.r),
                width: 343.w,
                height: 132.h,
                decoration: BoxDecoration(
                  color: AppColors.blueE7F,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/worning_icon.svg"),
                        WidthSpacing(width: 10),
                        Text(
                          'Select your rental period to\n see available carts.',
                          style: AppTextStyles.blue101w400s16.copyWith(
                            color: AppColors.blue1C3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showStartDatePicker() async {
    endDate = null;
    final pickedStartsDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 180)),
    );
    if (pickedStartsDate != null) {
      setState(() {
        startDate = pickedStartsDate;
        calcTotalRentingDays();
      });
    }
  }

  void _showEndDatePicker() async {
    final pickedendDate = await showDatePicker(
      context: context,
      firstDate:
          (startDate != null)
              ? startDate!.add(Duration(days: 1))
              : DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 180)),
    );
    if (pickedendDate != null) {
      setState(() {
        endDate = pickedendDate;
        calcTotalRentingDays();
      });
    }
  }

  void calcTotalRentingDays() {
    if (endDate != null && startDate != null) {
      totalDays = endDate!.difference(startDate!).inDays;
    }
  }
}
