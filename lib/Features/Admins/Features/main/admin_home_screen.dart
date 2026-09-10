import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/core/Widgets/clickable_card.dart';
import 'package:luxury_golf_app/core/Widgets/data_card.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class AdminsHomeScreen extends StatelessWidget {
  const AdminsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(24.r),
                width: MediaQuery.of(context).size.width,
                height: 204.h,
                decoration: BoxDecoration(color: AppColors.blue155),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Admin Portal', style: AppTextStyles.whiteFFFw400s24),
                    Text(
                      'Golf Cart Service Management',
                      style: AppTextStyles.blueE7Fw400s14,
                    ),
                    const HightSpacing(hight: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DataCardWidget(
                          text: 'Total Cars',
                          number: '60',
                        ), //TODO : Change this with Correct Data
                        DataCardWidget(
                          text: 'Requests',
                          number: '32',
                        ), //TODO : Change this with Correct Data
                        DataCardWidget(
                          text: 'Staff',
                          number: '10',
                        ), //TODO : Change this with Correct Data
                      ],
                    ),
                  ],
                ),
              ),
              const HightSpacing(hight: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Management Categories',
                          style: AppTextStyles.grey4A5w400s14,
                        ),
                        const HightSpacing(hight: 16),
                        ClickableCardWidget(
                          mainText: 'Add New Cars',
                          subTex: 'Register fleet vehicles',
                          svgPath: 'assets/icons/golf_ca_155DFCr_icon.svg',
                          bordersColor: AppColors.blueC6D,
                          containerColor: AppColors.blueEEF,
                          iconColor: AppColors.blue4F3,
                          onPress: () {
                            context.pushNamed(AppRouts.addNewCar);
                          }, //TODO : Add Function
                        ),
                        const HightSpacing(hight: 16),
                        ClickableCardWidget(
                          mainText: 'Service Requests',
                          subTex: 'Manage customer requests',
                          svgPath: 'assets/icons/requests_Icon.svg',
                          bordersColor: AppColors.orangeFFD,
                          containerColor: AppColors.orangeFFD,
                          iconColor: AppColors.orangeF54,
                          onPress: () {}, //TODO : Add Function
                        ),
                        const HightSpacing(hight: 16),
                        ClickableCardWidget(
                          mainText: 'Employee Accounts',
                          subTex: 'Update,Delete,Add,accounts',
                          svgPath: 'assets/icons/add_emp_icon.svg',
                          bordersColor: AppColors.redFCC,
                          containerColor: AppColors.redFCC,
                          iconColor: AppColors.redE70,
                          onPress: () {
                            context.pushNamed(AppRouts.addNewEmp);
                          }, //TODO : Add Function
                        ),
                        const HightSpacing(hight: 16),
                        ClickableCardWidget(
                          mainText: 'Reports',
                          subTex: 'Fleet & financial reports',
                          svgPath: 'assets/icons/reports_icon.svg',
                          bordersColor: AppColors.greenB9F,
                          containerColor: AppColors.greenB9F,
                          iconColor: AppColors.green00A,
                          onPress: () {}, //TODO : Add Function
                        ),
                        const HightSpacing(hight: 16),
                        ClickableCardWidget(
                          mainText: 'Spare Parts report',
                          subTex: 'Inventory management',
                          svgPath: 'assets/icons/spare_parts_icon.svg',
                          bordersColor: AppColors.blueC6D,
                          containerColor: AppColors.blueE9D,
                          iconColor: AppColors.blue981,
                          onPress: () {}, //TODO : Add Function
                        ),
                        const HightSpacing(hight: 16),
                        ClickableCardWidget(
                          mainText: 'Work Hours',
                          subTex: 'Change Work Hours',
                          svgPath: 'assets/icons/work_hours_icon.svg',
                          bordersColor: AppColors.greenF0F,
                          containerColor: AppColors.greenF0F,
                          iconColor: AppColors.green009,
                          onPress: () {}, //TODO : Add Function
                        ),
                        const HightSpacing(hight: 16),
                        ClickableCardWidget(
                          mainText: 'Settings',
                          subTex: 'System configuration',
                          svgPath: 'assets/icons/setings_icon.svg',
                          bordersColor: AppColors.greyE5E,
                          containerColor: AppColors.greyE5E,
                          iconColor: AppColors.grey4A5,
                          onPress: () {}, //TODO : Add Function
                        ),
                        const HightSpacing(hight: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
