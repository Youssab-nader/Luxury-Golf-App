
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luxury_golf_app/Features/main/home_controller.dart';
import 'package:luxury_golf_app/Features/main/home_screen.dart';
import 'package:luxury_golf_app/Features/main/inbox_screen.dart';
import 'package:luxury_golf_app/Features/main/profile_screen.dart';
import 'package:provider/provider.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _currentIndex = 0;
  final List<Widget> _screens = [HomeScreen(), InboxScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeController(),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home_icon.svg'),
              activeIcon: SvgPicture.asset('assets/icons/home_icon_colored.svg'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/inbox_icon_dis.svg'),
              activeIcon: SvgPicture.asset('assets/icons/inbox_icon_ina.svg'),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/profile_icon.svg'),
              activeIcon: SvgPicture.asset(
                'assets/icons/profile_icon_colored.svg',
              ),
              label: 'Profile',
            ),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: SafeArea(child: Column(children: [_screens[_currentIndex]])),
      ),
    );
  }
}
