import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  final String labelText;
  final String? labelIconPath;
  final String hintText;
  final TextEditingController? textController;
  String? starIcon;
  int? maxLines;
  bool isPassword;
  final String? Function(String?)? validationString;

  TextFieldWidget({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.maxLines,
    required this.hintText,
    this.starIcon,
    this.validationString,
    this.textController,
    this.labelIconPath,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

bool disPass = false;

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const HightSpacing(hight: 3),
        Row(
          children: [
            (widget.labelIconPath != null)
                ? SvgPicture.asset(widget.labelIconPath!)
                : SizedBox(),
            Text(widget.labelText, style: AppTextStyles.textLable),
            Text(
              widget.starIcon ?? '',
              style: TextStyle(color: Colors.red, fontSize: 15.sp),
            ),
          ],
        ),
        HightSpacing(hight: 5),
        SizedBox(
          width: 343.w,
          child: TextFormField(
            keyboardType: TextInputType.name,
            controller: widget.textController,
            validator: widget.validationString,
            maxLines: widget.maxLines ?? 1,
            obscureText: (widget.isPassword && !disPass),
            decoration: InputDecoration(
              suffixIcon:
                  widget.isPassword
                      ? IconButton(
                        icon:
                            disPass
                                ? Icon(Icons.visibility_sharp)
                                : Icon(Icons.visibility_off_sharp),
                        onPressed: () {
                          setState(() {
                            disPass = !disPass;
                          });
                        },
                      )
                      : null,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.w),
                borderRadius: BorderRadius.circular(8.r),
              ),
              errorStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              hintText: widget.hintText,
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
