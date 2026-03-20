import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luxury_golf_app/core/Components/screen_header_widget.dart';
import 'package:luxury_golf_app/core/Models/car_model.dart';
import 'package:luxury_golf_app/core/Models/num_of_seats_model.dart';
import 'package:luxury_golf_app/core/Widgets/buttom_widget.dart';
import 'package:luxury_golf_app/core/Widgets/image_picking_widget.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/Widgets/text_field_widget.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class AddNewCarScreen extends StatefulWidget {
  const AddNewCarScreen({super.key});

  @override
  State<AddNewCarScreen> createState() => _AddNewCarScreenState();
}

class _AddNewCarScreenState extends State<AddNewCarScreen> {
  bool isFourSeats = true;
  final GlobalKey<FormState> _newCarFormKey = GlobalKey<FormState>();
  final TextEditingController _carNumController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _carColorController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  List<File> _carImages = [];

  void pickImages() async {
    final List<XFile> pickedImages = await picker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      setState(() {
        _carImages = pickedImages.map((image) => File(image.path)).toList();
      });
    }
  }

  @override
  void dispose() {
    _carNumController.dispose();
    _yearController.dispose();
    _brandController.dispose();
    _carColorController.dispose();
    _modelController.dispose();
    super.dispose();
  }

  //   final ImagePicker picker = ImagePicker();
  //   void pickImages() async {
  //     final List<XFile> pickedImages = await picker.pickMultiImage();

  //     if (pickedImages.isNotEmpty) {
  //       setState(() {
  //         _carImages = pickedImages.map((image) => File(image.path)).toList();
  //       });
  //     }
  //   }

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
                        Container(
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
                          child:
                              _carImages.isEmpty
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
                                          itemCount: _carImages.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 1,
                                              ),
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            final image = _carImages[index];
                                            return Container(
                                              margin: EdgeInsets.all(2),
                                              padding: EdgeInsets.all(1),
                                              width: 50,
                                              height: 50.h,
                                              decoration: BoxDecoration(
                                                border:
                                                    (index == 0)
                                                        ? Border.all(
                                                          color:
                                                              AppColors.blue155,
                                                          width: 2,
                                                        )
                                                        : null,
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                              ),

                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadiusGeometry.circular(
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
                                                          setState(() {
                                                            _carImages.removeAt(
                                                              index,
                                                            );
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons.highlight_off,
                                                          color:
                                                              AppColors
                                                                  .black0A0,
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
                        ),
                      ],
                    ),
                  ),
                ),
                ButtomWidget(
                  text: 'Add Golf Cart to Fleet',
                  buttomWidth: 320,
                  onPressed: () async {
                    if ((_newCarFormKey.currentState?.validate() ?? false) &&
                        (_carImages.isNotEmpty)) {
                      //TODO: Add Car in DB With API
                      NumOfSeats numOfSeats =
                          isFourSeats ? NumOfSeats.f4 : NumOfSeats.s6;
                      final CompanyCarModel newCar = CompanyCarModel(
                        modelYear: _yearController.text,
                        brandName: _brandController.text,
                        model: _modelController.text,
                        color: _carColorController.text,
                        chassisNum: _carNumController.text,
                        numOfSeats: numOfSeats,
                        isAvailable: true,
                        rentPricePerDay: 0,
                        imagesPaths: _carImages,
                      );
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 350.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 23.h,
                            ),

                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/success_icon.svg',
                                ),
                                const HightSpacing(hight: 21),
                                Text(
                                  'The New car Added successfully',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.green00A,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const HightSpacing(hight: 16),
                                Text(
                                  '${newCar.id} car is ready to rent Now',
                                  style: AppTextStyles.grey4A5w400s14.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const HightSpacing(hight: 16),
                                ButtomWidget(
                                  text: 'Return to Main Page',
                                  onPressed:
                                      () => context.pushReplacementNamed(
                                        AppRouts.adminsHome,
                                      ),

                                  buttomWidth: 311,
                                  buttomhight: 44,
                                ),
                                const HightSpacing(hight: 16),
                                ButtomWidget(
                                  text: 'Add another car',
                                  onPressed:
                                      () => context.pushReplacementNamed(
                                        AppRouts.addNewCar,
                                      ),

                                  buttomWidth: 311,
                                  buttomhight: 44,
                                  backgroundColor: AppColors.white,
                                  forgroundColor: AppColors.black,
                                ),
                              ],
                            ),
                          );
                        },
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
