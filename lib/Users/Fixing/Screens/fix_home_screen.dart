import 'package:flutter/material.dart';
import 'package:luxury_golf_app/Users/Screens/service_first_screen.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styling/app_colors.dart';

class FixScreen extends StatefulWidget {
  const FixScreen({super.key});

  @override
  State<FixScreen> createState() => _FixScreenState();
}

class _FixScreenState extends State<FixScreen> {
  @override
  Widget build(BuildContext context) {
    return ServiceFirstScreen(
      topImagePath: 'assets/images/fix_man.jpg',
      svgImagePath: 'assets/icons/key_icon.svg',
      mainText: 'Repair Service',
      subText: 'Request repairs for specific sections',
      mainIconColor: AppColors.blue2B15,
      navScreenName: AppRouts.checkOutRepairCustomerInfo,
    );
  }
}
    // return Scaffold(
    //   extendBodyBehindAppBar: true,
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         Stack(
    //           children: [
    //             Image.asset(
    //               'assets/images/fix_man.jpg',
    //               width: double.infinity,
    //               height: 256.h,
    //               fit: BoxFit.fill,
    //             ),
    //             Positioned(
    //               left: 8.w,
    //               top: 23.h,
    //               child: IconButton(
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                 },
    //                 icon: Icon(Icons.arrow_back),
    //               ),
    //             ),
    //           ],
    //         ),
    //         Padding(
    //           padding: EdgeInsetsGeometry.fromLTRB(24.w, 69.h, 12.w, 80.h),
    //           child: Column(
    //             children: [
    //               ServiceCategoryCard(
    //                 gradientColor: AppColors.blue2B15,
    //                 mainText: 'Repair Service',
    //                 subText: 'Request repairs for specific sections',
    //                 svgIconPath: 'assets/icons/key_icon.svg',
    //                 cardWidth: 339,
    //                 onTap: () {
    //                   context.pushNamed(AppRouts.checkOutRepairCustomerInfo);
    //                 },
    //               ),
    //               const HightSpacing(hight: 18),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   ServiceCategoryCard(
    //                     gradientColor: AppColors.green3101,
    //                     mainText: 'Pending service',
    //                     subText: 'View Pending\n services',
    //                     svgIconPath: 'assets/icons/pinding_icon.svg',
    //                     cardWidth: 165,
    //                     onTap: () {
    //                   context.pushNamed(AppRouts.fixPindingServices);
    //                 },
    //                   ),
    //                   ServiceCategoryCard(
    //                     gradientColor: AppColors.orangeFFF5,
    //                     mainText: 'Service History',
    //                     subText: 'View past repairs',
    //                     svgIconPath: 'assets/icons/history_Icon.svg',
    //                     cardWidth: 165,
    //                     onTap: () {
    //                   context.pushNamed(AppRouts.fixHistory);
    //                 },
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //         NavigationBarWidget(),
    //       ],
    //     ),
    //   ),
    // );
