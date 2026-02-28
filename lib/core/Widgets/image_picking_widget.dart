import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luxury_golf_app/core/styling/app_colors.dart';
import 'package:luxury_golf_app/core/styling/app_styles.dart';

class ImagePickWidget extends StatefulWidget {
  final List<File> images;
  const ImagePickWidget({super.key, required this.images});

  @override
  State<ImagePickWidget> createState() => _ImagePickWidgetState();
}

class _ImagePickWidgetState extends State<ImagePickWidget> {
  List<File> _images = [];
  final ImagePicker picker = ImagePicker();

  void pickImages() async {
    final List<XFile> pickedImages = await picker.pickMultiImage();
    _images = widget.images;
    if (pickedImages.isNotEmpty) {
      setState(() {
        _images = pickedImages.map((image) => File(image.path)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _images.isEmpty
        ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: pickImages,
              child: SvgPicture.asset(
                'assets/icons/camera_icon.svg',
                width: 50.w,
                height: 50.h,
              ),
            ),
            Text('Tap to add photos (max 4)', style: AppTextStyles.subgreyText),
          ],
        )
        : Row(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: _images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final image = _images[index];
                  return Container(
                    margin: EdgeInsets.all(2),
                    padding: EdgeInsets.all(1),
                    width: 50,
                    height: 50.h,
                    decoration: BoxDecoration(
                      border:
                          (index == 0)
                              ? Border.all(color: AppColors.blue155, width: 2)
                              : null,
                      borderRadius: BorderRadius.circular(16.r),
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16.r),

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
                                setState(() {
                                  _images.removeAt(index);
                                });
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
        );
  }
}
