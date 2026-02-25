import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luxury_golf_app/Admins/Widgets/screen_header_widget.dart';
import 'package:luxury_golf_app/Company%20Services/Models/car_model.dart';
import 'package:luxury_golf_app/Company%20Services/Models/num_of_seats_model.dart';
import 'package:luxury_golf_app/core/Widgets/buttom_widget.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/Widgets/text_field_widget.dart';
import 'package:luxury_golf_app/core/styling/app_colors.dart';
import 'package:luxury_golf_app/core/styling/app_styles.dart';

class AddNewCarScreen extends StatefulWidget {
  const AddNewCarScreen({super.key});

  @override
  State<AddNewCarScreen> createState() => _AddNewCarScreenState();
}

final GlobalKey<FormState> _newCarFormKey = GlobalKey<FormState>();
final TextEditingController _carNumController = TextEditingController();
final TextEditingController _brandController = TextEditingController();
final TextEditingController _carColorController = TextEditingController();
final TextEditingController _modelController = TextEditingController();
final TextEditingController _yearController = TextEditingController();
bool isFourSeats = true;
NumOfSeats numOfSeats = isFourSeats ? NumOfSeats.four : NumOfSeats.six;

class _AddNewCarScreenState extends State<AddNewCarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _newCarFormKey,
            child: Column(
              children: [
                ScreenHeaderWidget(
                  mainText: 'Add New Car',
                  subText: 'Register a new golf cart to the fleet',
                  color: AppColors.green34C,
                ),
                HightSpacing(hight: 16),
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    width: 343.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.50),
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Basic Information',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue101,
                          ),
                        ),

                        HightSpacing(hight: 16),
                        TextFieldWidget(
                          textController: _carNumController,
                          labelText: 'Car Number (Chassis number)',
                          hintText: ' EX : Zxc1565161',
                          starIcon: ' *',
                          width: 303,
                          validationString: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Enter Chassis number';
                            } else if (value.trim().length != 17) {
                              return 'The Chassis number not Correct';
                            }
                            return null;
                          },
                        ),
                        HightSpacing(hight: 10),
                        TextFieldWidget(
                          textController: _brandController,
                          labelText: 'Brand',
                          hintText: 'e.g., Club Car, EZGO, Yamaha',
                          starIcon: ' *',
                          width: 303,
                          validationString: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Enter Car Brand';
                            }
                            return null;
                          },
                        ),
                        HightSpacing(hight: 10),
                        TextFieldWidget(
                          textController: _modelController,
                          labelText: 'Model',
                          hintText: 'e.g., Precedent, RXV',
                          starIcon: ' *',
                          width: 303,
                          validationString: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Enter Car Model';
                            }
                            return null;
                          },
                        ),
                        HightSpacing(hight: 10),
                        TextFieldWidget(
                          textController: _yearController,
                          labelText: 'Year',
                          hintText: 'e.g., 2010 , 2021',
                          starIcon: ' *',
                          width: 303,
                          validationString: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Enter Year of manufacture';
                            } else if (value.trim().length != 4) {
                              return 'Year of manufacture That You Entered is Not Valid';
                            }
                            return null;
                          },
                        ),
                        HightSpacing(hight: 10),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    width: 343.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.50),
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/specifications_icon.svg',
                            ),
                            WidthSpacing(width: 8),
                            Text(
                              'Specifications',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blue101,
                              ),
                            ),
                          ],
                        ),

                        HightSpacing(hight: 16),
                        TextFieldWidget(
                          textController: _carColorController,
                          labelText: ' Color',
                          hintText: '',
                          labelIconPath: 'assets/icons/color_icon.svg',
                          width: 303,
                          validationString: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Enter Car Color';
                            }
                            return null;
                          },
                        ),
                        HightSpacing(hight: 10),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/seating_capacity_icon.svg',
                            ),
                            Text(
                              '  Seating Capacity',
                              style: AppTextStyles.textLable,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isFourSeats = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    isFourSeats
                                        ? AppColors.blueBED
                                        : AppColors.white,
                                shadowColor: AppColors.white,
                              ),
                              child: Text(
                                '4-Seates',
                                style: AppTextStyles.grey4A5w400s14.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            WidthSpacing(width: 10),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    isFourSeats
                                        ? AppColors.white
                                        : AppColors.blueBED,
                                shadowColor: AppColors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  isFourSeats = false;
                                });
                              },
                              child: Text(
                                '6-Seates',
                                style: AppTextStyles.grey4A5w400s14.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    width: 343.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.50),
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upload photos',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue101,
                          ),
                        ),
                        HightSpacing(hight: 16),
                        InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            width: 360.w,
                            height: 135.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.6,
                                color: AppColors.greyD1D,
                              ),
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/camera_icon.svg',
                                ),
                                Text(
                                  'Tap to add photos (max 3)',
                                  style: AppTextStyles.subgreyText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ButtomWidget(
                  text: 'Add Golf Cart to Fleet',
                  buttomWidth: 320,
                  onPressed: () async {
                    if (_newCarFormKey.currentState?.validate() ?? false) {
                    
                      final CompanyCarModel newCar = CompanyCarModel(
                        modelYear: _yearController.text,
                        brandName: _brandController.text,
                        model: _modelController.text,
                        color: _carColorController.text,
                        chassisNum: _carNumController.text,
                        numOfSeats: numOfSeats,
                        busyList: [],
                        rentPricePerDay: 0,
                        imagesPath: [],
                      );
                    }
                  },
                  buttomhight: 52,
                  backgroundColor: AppColors.green34C,
                  r: 14,
                ),
                HightSpacing(hight: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
