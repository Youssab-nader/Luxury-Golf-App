import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luxury_golf_app/core/Enums/cars_models_enum.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class CarModelDropDown extends StatelessWidget {
  final String labelText;
  final Widget hint;
  final Function(CarsModelsEnum?) onChanged;
  const CarModelDropDown({
    super.key,
    required this.labelText,
    required this.onChanged,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: AppTextStyles.textLable),
        HightSpacing(hight: 5),
        DropdownButtonHideUnderline(
          child: DropdownButton2<CarsModelsEnum>(
            isExpanded: true,
            hint: hint,

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
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
