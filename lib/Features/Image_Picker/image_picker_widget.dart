import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luxury_golf_app/Features/Image_Picker/image_picker_controller.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';
import 'package:provider/provider.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ImagePickerController>(
      builder: (context, ImagePickerController controller, child) {
        return Container(
          alignment: Alignment.center,
          width: 360.w,
          height: 135.h,
          decoration: BoxDecoration(
            border: Border.all(width: 1.6, color: AppColors.greyD1D),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child:
              controller.images.isEmpty
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: controller.pickImages,
                        child: SvgPicture.asset(
                          'assets/icons/camera_icon.svg',
                          width: 50.w,
                          height: 50.h,
                        ),
                      ),
                      Text(
                        'Tap to add photos (max 4)',
                        style: AppTextStyles.subgreyText,
                      ),
                    ],
                  )
                  : Row(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          itemCount: controller.images.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                              ),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final image = controller.images[index];
                            return Container(
                              margin: EdgeInsets.all(2),
                              padding: EdgeInsets.all(1),
                              width: 50,
                              height: 50.h,
                              decoration: BoxDecoration(
                                border:
                                    (index == 0)
                                        ? Border.all(
                                          color: AppColors.blue155,
                                          width: 2,
                                        )
                                        : null,
                                borderRadius: BorderRadius.circular(16.r),
                              ),

                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  16.r,
                                ),
                                child: Stack(
                                  children: [
                                    Image.file(
                                      image,
                                      fit: BoxFit.fitHeight,
                                      width: 200.w,
                                      height: 200.h,
                                    ),
                                    Positioned(
                                      top: 1.h,
                                      right: 2.w,
                                      child: IconButton(
                                        onPressed: () {
                                          controller.removeImage(index);
                                        },
                                        icon: Icon(
                                          Icons.highlight_off,
                                          color: AppColors.black0A0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
        );
      },
    );
  }
}
