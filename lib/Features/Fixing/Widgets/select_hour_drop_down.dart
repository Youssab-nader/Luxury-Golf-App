import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luxury_golf_app/core/Enums/cars_models_enum.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class SelectHourDropDown extends StatefulWidget {
  final String labelText;
  const SelectHourDropDown({super.key, required this.labelText});

  @override
  State<SelectHourDropDown> createState() => _SelectHourDropDownState();
}

class _SelectHourDropDownState extends State<SelectHourDropDown> {
  CarsModelsEnum? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: AppTextStyles.textLable),
        HightSpacing(hight: 5),
        DropdownButtonHideUnderline(
          child: DropdownButton2<CarsModelsEnum>(
            isExpanded: true,
            hint:
                (selectedValue != null)
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedValue?.modelName ?? ''),
                        Image.asset(
                          selectedValue?.modelLogoPath ??
                              'assets/images/other_model_image.png',
                          width: 50.w,
                          height: 15.h,
                        ),
                      ],
                    )
                    : Text(
                      'Select Session start hour',
                      style: AppTextStyles.grey4A5w400s14.copyWith(
                        color: Color(0xff9CA3AF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            items:
                CarsModelsEnum.values.map((model) {
                  return DropdownItem<CarsModelsEnum>(
                    value: model,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(model.modelName),
                        Image.asset(model.modelLogoPath, width: 50, height: 15),
                      ],
                    ),
                  );
                }).toList(),
            buttonStyleData: ButtonStyleData(
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyADA),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 250.h,
              width: 330.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.white,
              ),
            ),

            iconStyleData: IconStyleData(
              icon: SvgPicture.asset(
                'assets/icons/pubup_icon.svg',
                width: 32.w,
                height: 32.h,
              ),
            ),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
