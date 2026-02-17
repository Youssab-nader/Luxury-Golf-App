import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/Admins/Widgets/screen_header_widget.dart';
import 'package:luxury_golf_app/core/Widgets/buttom_widget.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styling/app_colors.dart';
import 'package:luxury_golf_app/core/styling/app_styles.dart';

class SeeAccountsScreen extends StatefulWidget {
  const SeeAccountsScreen({super.key});

  @override
  State<SeeAccountsScreen> createState() => _SeeAccountsScreenState();
}

class _SeeAccountsScreenState extends State<SeeAccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: ScreenHeaderWidget(
                mainText: 'Employee Accounts',
                subText: 'Manage employee accounts and access',
                hight: 88,
                width: MediaQuery.of(context).size.width,
                color: AppColors.blue615,
              ),
            ),
            HightSpacing(hight: 16),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total', style: AppTextStyles.grey4A5w400s14.copyWith()),
                Text(
                  '0', //TODO : Add Correct Data
                  style: AppTextStyles.blue0A9w600s28.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.blue4F3,
                  ),
                ),
                HightSpacing(hight: 12),
                ButtomWidget(
                  text: 'Add New Employee',
                  buttomWidth: 327,
                  svgIconPath: 'assets/icons/add_emp_white.svg',
                  backgroundColor: AppColors.blue4F3,
                  onPressed: () {
                    context.pushNamed(AppRouts.addNewEmp);
                  },
                  buttomhight: 48,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
