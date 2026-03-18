import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luxury_golf_app/Features/main/home_screen.dart';
import 'package:luxury_golf_app/Features/main/inbox_screen.dart';
import 'package:luxury_golf_app/Features/main/profile_screen.dart';

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
    return Scaffold(
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
            activeIcon: SvgPicture.asset('assets/icons/profile_icon_colored.svg'),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _screens[_currentIndex],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
// import 'package:luxury_golf_app/core/styles/app_colors.dart';
// import 'package:luxury_golf_app/core/styles/app_styles.dart';

// class NavigationBarWidget extends StatefulWidget {
//   const NavigationBarWidget({super.key});

//   @override
//   State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
// }

// class _NavigationBarWidgetState extends State<NavigationBarWidget> {
//   bool homeTaped = true;
//   bool inboxTaped = false;
//   bool profileTaped = false;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         WidthSpacing(width: 40),
//         InkWell(
//           child: SizedBox(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SvgPicture.asset(
//                   homeTaped
//                       ? 'assets/icons/home_icon_colored.svg'
//                       : 'assets/icons/home_icon.svg',
//                   width: 24.w,
//                   height: 24.h,
//                 ),
//                 HightSpacing(hight: 5),
//                 Text(
//                   'Home',
//                   style:
//                       homeTaped
//                           ? AppTextStyles.grey585w500s10.copyWith(
//                             color: AppColors.blue044,
//                           )
//                           : AppTextStyles.grey585w500s10,
//                 ),
//               ],
//             ),
//           ),
//           onTap: () {
//             setState(() {
//               inboxTaped = false;
//               profileTaped = false;
//               homeTaped = !homeTaped;
//             });
//           },
//         ),
//         WidthSpacing(width: 90),
//         InkWell(
//           child: SizedBox(
//             width: 40.w,
//             height: 90.h,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                   inboxTaped
//                       ? 'assets/icons/inbox_icon_ina.svg'
//                       : 'assets/icons/inbox_icon_dis.svg',
//                   width: 24.w,
//                   height: 24.h,
//                 ),
//                 HightSpacing(hight: 5),
//                 Text(
//                   'Favorite',
//                   style:
//                       inboxTaped
//                           ? AppTextStyles.grey585w500s10.copyWith(
//                             color: AppColors.blue044,
//                           )
//                           : AppTextStyles.grey585w500s10,
//                 ),
//               ],
//             ),
//           ),
//           onTap: () {
//             setState(() {
//               inboxTaped = !inboxTaped;
//               homeTaped = false;
//               profileTaped = false;
//             });
//           },
//         ),
//         WidthSpacing(width: 90),
//         InkWell(
//           child: SizedBox(
//             width: 40.w,
//             height: 90.h,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                   profileTaped
//                       ? 'assets/icons/profile_icon_colored.svg'
//                       : 'assets/icons/profile_icon.svg',
//                   width: 24.w,
//                   height: 24.h,
//                 ),
//                 HightSpacing(hight: 5),
//                 Text(
//                   'Profile',
//                   style:
//                       profileTaped
//                           ? AppTextStyles.grey585w500s10.copyWith(
//                             color: AppColors.blue044,
//                           )
//                           : AppTextStyles.grey585w500s10,
//                 ),
//               ],
//             ),
//           ),
//           onTap: () {
//             setState(() {
//               profileTaped = !profileTaped;
//               inboxTaped = false;
//               homeTaped = false;
//             });
//           },
//         ),
//       ],
//     );
//   }
// }
