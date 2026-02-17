import 'package:flutter/material.dart';
import 'package:luxury_golf_app/Users/Screens/service_first_screen.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styling/app_colors.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreen();
}

class _EventsScreen extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return ServiceFirstScreen(
      topImagePath: 'assets/images/events_image.png',
      svgImagePath: 'assets/icons/events_icon.svg',
      mainText: 'Events Service',
      subText: 'Book golf car Events',
      mainIconColor: AppColors.orangeFFF5,
       navScreenName: AppRouts.bookEventOne,
    );
  }
}
    // Scaffold(
    //   extendBodyBehindAppBar: true,
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         Stack(
    //           children: [
    //             Image.asset(
    //               'assets/images/events_image.png',
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
    //           padding: EdgeInsetsGeometry.fromLTRB(24.w, 69.h, 12.w, 0.h),
    //           child: Column(
    //             children: [
    //               ServiceCategoryCard(
    //                 gradientColor: AppColors.blue2B15,
    //                 mainText: 'Garage Service',
    //                 subText: 'Keep your cart safe with us.',
    //                 svgIconPath: 'assets/icons/garage_icon.svg',
    //                 cardWidth: 339.w,
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
    //                       context.pushNamed(AppRouts.fixPindingServices);
    //                     },
    //                   ),
    //                   ServiceCategoryCard(
    //                     gradientColor: AppColors.orangeFFF5,
    //                     mainText: 'Service History',
    //                     subText: 'View past Events',
    //                     svgIconPath: 'assets/icons/history_Icon.svg',
    //                     cardWidth: 165,
    //                     onTap: () {
    //                       context.pushNamed(AppRouts.fixHistory);
    //                     },
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
