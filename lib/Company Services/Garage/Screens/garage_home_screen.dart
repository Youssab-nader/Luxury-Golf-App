import 'package:flutter/material.dart';
import 'package:luxury_golf_app/Users/Screens/service_first_screen.dart';
import 'package:luxury_golf_app/core/styling/app_colors.dart';

class GarageScreen extends StatefulWidget {
  const GarageScreen({super.key});

  @override
  State<GarageScreen> createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen> {
  @override
  Widget build(BuildContext context) {
    return ServiceFirstScreen(
      topImagePath: 'assets/images/garage_image.jpg',
      svgImagePath: 'assets/icons/white_garage.svg',
      mainText: 'Garage Service',
      subText: 'Keep your cart safe with us.',
      mainIconColor: AppColors.blue2B15,
      navScreenName: '',
    );
  }
}