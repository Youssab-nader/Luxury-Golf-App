import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styling/app_colors.dart';
import 'package:luxury_golf_app/core/styling/app_styles.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final double hight;
  String? suffixText;
  int? maxLines;
  bool? isPassword;

  TextFieldWidget({
    super.key,
    required this.labelText,
    this.isPassword,
    this.maxLines,
    required this.hintText,
    required this.hight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const HightSpacing(hight: 3),
        Text(labelText, style: AppTextStyles.textLable),
        HightSpacing(hight: 5),
        SizedBox(
          // width: 328.w,
          child: TextFormField(
            validator: (String? value) {
              // Regular Expresions wil Added
              if ((labelText.contains('name')) &&
                  (value == null || value.isEmpty)) {
                return "Please Enter your name";
              } else if (labelText.contains('name') &&
                  (value != null &&
                      (value.length < 7 || !value.contains(' ')))) {
                return "Please enter at least your full name (first, middle, and last).";
              }
              if ((labelText.contains('Phone')) &&
                  (value == null || value.isEmpty || value.length != 11)) {
                return "Please Enter Valid Phone number";
              }
              if ((labelText.contains('Email')) &&
                  (value == null || value.isEmpty)) {
                return "Please Enter Valid Email";
                // OTP Verificatin
              }
              return null;
            },

            // maxLines: maxLines ?? 1,
            obscureText: isPassword ?? false,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.w),
                borderRadius: BorderRadius.circular(8.r),
              ),
              errorStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff44A0FC)),
                borderRadius: BorderRadius.circular(8.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyADA),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
