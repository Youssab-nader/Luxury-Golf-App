import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/Features/Fixing/Controllers/fix_service_controller.dart';
import 'package:luxury_golf_app/Features/Fixing/Widgets/select_hour_drop_down.dart';
import 'package:luxury_golf_app/Features/Location_Picker/flutter_map_picker_service.dart';
import 'package:luxury_golf_app/core/Components/data_card.dart';
import 'package:luxury_golf_app/Features/Fixing/Widgets/car_model_dropdown.dart';
import 'package:luxury_golf_app/core/Config/app_keys_config.dart';
import 'package:luxury_golf_app/core/Data/Local_data/local_storage_service.dart';
import 'package:luxury_golf_app/core/Enums/cars_models_enum.dart';
import 'package:luxury_golf_app/core/Models/validations_config.dart';
import 'package:luxury_golf_app/core/Widgets/bottom_widget.dart';
import 'package:luxury_golf_app/core/Widgets/small_slider_bar_widget.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/Widgets/text_field_widget.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_fonts.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';
import 'package:provider/provider.dart';

class CheckOutRepairCustomerInfo extends StatefulWidget {
  const CheckOutRepairCustomerInfo({super.key});

  @override
  State<CheckOutRepairCustomerInfo> createState() =>
      _CheckOutRepairCustomerInfoState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _CheckOutRepairCustomerInfoState
    extends State<CheckOutRepairCustomerInfo> {
  final TextEditingController _phoneNumController = TextEditingController();

  String? selectedAddress;
  CarsModelsEnum? selectedCarModel;
  DateTime? selectedDate;

  @override
  void dispose() {
    _phoneNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Golf Cart Repair Request",
          style: AppTextStyles.blue101w400s16.copyWith(
            fontFamily: AppFonts.secondFont,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(11.w, 0, 7.w, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fill out the form below to request repair service for your golf cart.",
                  style: AppTextStyles.grey4A5w400s14,
                ),
                const HightSpacing(hight: 16),
                Center(child: SizedBox(width: 305.w, child: Divider())),
                const HightSpacing(hight: 16),
                SmallSliderBarWidget(isFull: false),
                const HightSpacing(hight: 16),
                Text(
                  'Customer Information',
                  style: AppTextStyles.blue101w400s16,
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
                    children: [
                      TextFieldWidget(
                        labelText: 'Phone number',
                        hintText: '+(20)0121234567',
                        textController: _phoneNumController,
                        validationString: ValidationsConfig.phoneValidation(),
                      ),
                      HightSpacing(hight: 10),
                      CarModelDropDown(
                        labelText: 'Golf car model',
                        onChanged: (CarsModelsEnum? value) {
                          setState(() {
                            selectedCarModel = value;
                          });
                        },
                        hint:
                            (selectedCarModel != null)
                                ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(selectedCarModel?.modelName ?? ''),
                                    Image.asset(
                                      selectedCarModel?.modelLogoPath ??
                                          'assets/images/other_model_image.png',
                                      width: 50.w,
                                      height: 15.h,
                                    ),
                                  ],
                                )
                                : Text(
                                  'Select golf car mode',
                                  style: AppTextStyles.grey4A5w400s14.copyWith(
                                    color: Color(0xff9CA3AF),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                      ),
                      HightSpacing(hight: 10),
                      DataSelectionWidget(
                        labelText: 'Session Date',
                        selectionTitle:
                            (selectedDate != null)
                                ? selectedDate!
                                    .toIso8601String()
                                    .split('T')
                                    .first
                                : 'Choose your session  Date',
                        suffixWidget: GestureDetector(
                          onTap: () {
                            _showDatePicker();
                          },
                          child: SvgPicture.asset('assets/icons/date_icon.svg'),
                        ),
                      ),
                      HightSpacing(hight: 10),
                      DataSelectionWidget(
                        labelText: 'Location ',
                        selectionTitle:
                            (selectedAddress == null)
                                ? 'Select Your Location'
                                : selectedAddress!,
                        suffixWidget: GestureDetector(
                          onTap: () {
                            _getLocation();
                          },
                          child: SvgPicture.asset(
                            'assets/icons/location_icon.svg',
                          ),
                        ),
                      ),
                      HightSpacing(hight: 10),
                      SelectHourDropDown(labelText: 'Session start hour'),
                    ],
                  ),
                ),
                const HightSpacing(hight: 18),
                Center(
                  child: BottomWidget(
                    text: 'Continue',
                    bottomWidth: 310,
                    bottomHight: 44,
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        if (selectedCarModel == null) {
                          showErrorMassage('Please Select Your Car Model');
                        } else if (selectedDate == null) {
                          showErrorMassage('Please Select Session Date');
                        } else if (selectedAddress == null) {
                          showErrorMassage('Please Select Your Location');
                        }
                        // TODO : Make one For Session Hour
                        // else if (selectedAddress == null) {
                        //   showErrorMassage('Please Select Your Location');
                        // }
                        else {
                          context.read<FixServiceController>().setCustomerInfo(
                            name:
                                PreferencesManager().getString(
                                  key: AppKeysConfig.userNameKey,
                                ) ??
                                'Null',
                            phone: _phoneNumController.text,
                            model: selectedCarModel!.modelName,
                            date:
                                selectedDate!
                                    .toIso8601String()
                                    .split('T')
                                    .first,
                            location: selectedAddress!,
                          );

                          context.pushNamed(AppRouts.checkOutRepairDetails);
                        }
                      }
                    },
                  ),
                ),
                const HightSpacing(hight: 19),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showErrorMassage(String errorMassage) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Center(child: Text(errorMassage))));
  }

  Future<String?> getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lng);

      Placemark place = placeMarks.first;

      setState(() {
        selectedAddress =
            " ${place.subAdministrativeArea}, ${place.administrativeArea}";
      });
    } catch (e) {
      setState(() {
        selectedAddress = null;
      });
    }
    return selectedAddress;
  }

  void _showDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 7)),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _getLocation() async {
    final mapService = FlutterMapPickerService();

    final result = await mapService.pickLocation(context);

    if (result != null) {
      String? address = await getAddressFromLatLng(
        result.latitude,
        result.longitude,
      );

      print("Lat: ${result.latitude}, Lng: ${result.longitude}");
      print("Address: $address");
    }
  }
}
