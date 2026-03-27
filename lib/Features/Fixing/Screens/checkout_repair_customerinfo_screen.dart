import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
// import 'package:luxury_golf_app/Features/Location_Picker/flutter_map_picker_service.dart';
import 'package:luxury_golf_app/core/Components/data_card.dart';
import 'package:luxury_golf_app/core/Components/dropdown.dart';
import 'package:luxury_golf_app/core/Widgets/buttom_widget.dart';
import 'package:luxury_golf_app/core/Widgets/small_slider_bar_widget.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/Widgets/text_field_widget.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_fonts.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

// ignore: must_be_immutable
class CheckOutRepairCustomerInfo extends StatefulWidget {
  CheckOutRepairCustomerInfo({super.key});
  int selectedIndex = 0;
  @override
  State<CheckOutRepairCustomerInfo> createState() =>
      _CheckOutRepairCustomerInfoState();
}

final GlobalKey<FormState> _key = GlobalKey<FormState>();

class _CheckOutRepairCustomerInfoState
    extends State<CheckOutRepairCustomerInfo> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(11.w, 57.h, 7.w, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                        hintText: '0121234567',
                      ),
                      HightSpacing(hight: 10),
                      DropDownWidget(labelText: 'Golf car model'),
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
                        selectionTitle: 'Select Your Location',
                        suffixWidget: GestureDetector(
                          onTap: () {
                            // _getLocation();
                          },
                          child: SvgPicture.asset(
                            'assets/icons/location_icon.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const HightSpacing(hight: 18),
                Center(
                  child: ButtomWidget(
                    text: 'Continue',
                    buttomWidth: 310,
                    buttomhight: 44,
                    onPressed: () {
                      if (_key.currentState?.validate() ?? false) {
                        context.pushNamed(AppRouts.checkOutRepairDetails);
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

//   void _getLocation() async {
//     final mapService = FlutterMapPickerService();

//     final result = await mapService.pickLocation(context);

//     if (result != null) {
//       print("Lat: ${result.latitude}, Lng: ${result.longitude}");
//     }
//   }
}
