import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/core/Widgets/buttom_widget.dart';
import 'package:luxury_golf_app/core/Widgets/image_picking_widget.dart';
import '../Widgets/fix_section_card.dart';
import 'package:luxury_golf_app/core/Widgets/small_slider_bar_widget.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/Widgets/text_field_widget.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_fonts.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class CheckOutRepairDetails extends StatefulWidget {
  const CheckOutRepairDetails({super.key});

  @override
  State<CheckOutRepairDetails> createState() => _CheckOutRepairDetailsState();
}

class _CheckOutRepairDetailsState extends State<CheckOutRepairDetails> {
  final List<File> images = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(11.w, 57.h, 7.w, 0),
          child: Column(
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
              SmallSliderBarWidget(isFull: true),
              const HightSpacing(hight: 16),
              Text(
                'Repair Details',
                style: AppTextStyles.textLable.copyWith(fontSize: 16.sp),
              ),
              Text(
                'Which Section Needs Fixing? *',
                style: AppTextStyles.black16w400.copyWith(fontSize: 14.sp),
              ),
              const HightSpacing(hight: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FixSectionCard(
                    svgPicPath: 'assets/icons/battary_icon.svg',
                    cardText: 'Battery & Electrical System',
                  ),
                  FixSectionCard(
                    svgPicPath: 'assets/icons/charger_icon.svg',
                    cardText: 'Charer',
                  ),
                ],
              ),
              const HightSpacing(hight: 17.14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FixSectionCard(
                    svgPicPath: 'assets/icons/tire_icon.svg',
                    cardText: 'Tires & Brakes',
                  ),
                  FixSectionCard(
                    svgPicPath: 'assets/icons/sus_icon.svg',
                    cardText: 'Suspension',
                  ),
                ],
              ),
              const HightSpacing(hight: 17.14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FixSectionCard(
                    svgPicPath: 'assets/icons/light_icon.svg',
                    cardText: 'Lights & Signals',
                  ),
                  FixSectionCard(
                    svgPicPath: 'assets/icons/body_icon.svg',
                    cardText: 'Body & Frame',
                  ),
                ],
              ),
              const HightSpacing(hight: 17.14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FixSectionCard(
                    svgPicPath: 'assets/icons/seates_icon.svg',
                    cardText: 'Seats & Upholstery',
                  ),
                  FixSectionCard(
                    svgPicPath: 'assets/icons/anOther_icon.svg',
                    cardText: 'Other',
                  ),
                ],
              ),
              const HightSpacing(hight: 14),

              TextFieldWidget(
                labelText: 'Problem Description *',
                maxLines: 5,

                hintText:
                    'Please describe the issue in detail. What symptoms are you experiencing? When did it start?',
              ),
              const HightSpacing(hight: 16),
              Container(
                alignment: Alignment.center,
                width: 360.w,
                height: 135.h,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.6, color: AppColors.greyD1D),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: ImagePickWidget(images: images),
              ),
              const HightSpacing(hight: 32),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtomWidget(
                      text: 'Back',
                      buttomhight: 36.h,
                      buttomWidth: 173.w,
                      onPressed: () {
                        context.pop();
                      },
                      forgroundColor: AppColors.black,
                      backgroundColor: AppColors.white,
                    ),
                    ButtomWidget(
                      text: 'submit',
                      buttomhight: 36.h,
                      buttomWidth: 150.w,
                      onPressed: () {
                        context.pushNamed(AppRouts.checkOutRepairConfirm);
                      },
                    ),
                  ],
                ),
              ),
              const HightSpacing(hight: 100),
            ],
          ),
        ),
      ),
    );
  }
}
