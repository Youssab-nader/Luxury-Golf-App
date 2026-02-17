import 'package:flutter/material.dart';
import 'package:luxury_golf_app/Users/Screens/service_first_screen.dart';
import 'package:luxury_golf_app/core/styling/app_colors.dart';

class RentScreen extends StatefulWidget {
  const RentScreen({super.key});

  @override
  State<RentScreen> createState() => _RentScreen();
}

class _RentScreen extends State<RentScreen> {
  @override
  Widget build(BuildContext context) {
    return ServiceFirstScreen(
      topImagePath: 'assets/images/golf_car_service_card.jpg',
      svgImagePath: 'assets/icons/white_golf_car.svg',
      mainText: 'Rent Service',
      subText: 'Let’s find your next ride',
      mainIconColor: AppColors.green0049,
      navScreenName: '',
    );
  }
}
