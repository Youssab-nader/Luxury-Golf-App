import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/Admins/Screens/add_new_car_screen.dart';
import 'package:luxury_golf_app/Admins/Screens/add_new_emp.dart';
import 'package:luxury_golf_app/Admins/Screens/admin_home_screen.dart';
import 'package:luxury_golf_app/Admins/Screens/see_accounts_screen.dart';
import 'package:luxury_golf_app/Company%20Services/Events/Screens/book_event_one_screen.dart';
import 'package:luxury_golf_app/Company%20Services/Events/Screens/events_home_screen.dart';
import 'package:luxury_golf_app/Company%20Services/Fixing/Screens/checkout_repair_confirm_screen.dart';
import 'package:luxury_golf_app/Company%20Services/Fixing/Screens/checkout_repair_customerinfo_screen.dart';
import 'package:luxury_golf_app/Company%20Services/Fixing/Screens/checkout_repair_details_screen.dart';
import 'package:luxury_golf_app/Company%20Services/Fixing/Screens/fix_history_service_screen.dart';
import 'package:luxury_golf_app/Company%20Services/Fixing/Screens/fix_pinding_service_screen.dart';
import 'package:luxury_golf_app/Company%20Services/Fixing/Screens/fix_home_screen.dart';
import 'package:luxury_golf_app/Company%20Services/Garage/Screens/garage_home_screen.dart';
import 'package:luxury_golf_app/Company%20Services/Rent/Screens/rent_home_screen.dart';
import 'package:luxury_golf_app/Users/Screens/get_started_screen.dart';
import 'package:luxury_golf_app/Users/Screens/home_screen.dart';
import 'package:luxury_golf_app/Users/Screens/login_screen.dart';
import 'package:luxury_golf_app/Users/Screens/sign_up_screen.dart';
import 'package:luxury_golf_app/Users/Screens/splash_screen.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';

class RouterGeneration {
  static GoRouter mainRoutingInApp = GoRouter(
    errorBuilder:
        (context, state) =>
            Scaffold(body: Center(child: Text('Invalide Screen'))),
    initialLocation: AppRouts.adminsHome,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        name: AppRouts.splash,
        path: AppRouts.splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        name: AppRouts.getSrarted,
        path: AppRouts.getSrarted,
        builder: (context, state) => GetStartedScreen(),
      ),
      GoRoute(
        name: AppRouts.signUp,
        path: AppRouts.signUp,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        name: AppRouts.addNewEmp,
        path: AppRouts.addNewEmp,
        builder: (context, state) => AddNewEmpScreen(),
      ),
      GoRoute(
        name: AppRouts.addNewCar,
        path: AppRouts.addNewCar,
        builder: (context, state) => AddNewCarScreen(),
      ),
      GoRoute(
        name: AppRouts.adminsHome,
        path: AppRouts.adminsHome,
        builder: (context, state) => AdminsHomeScreen(),
      ),
      GoRoute(
        name: AppRouts.login,
        path: AppRouts.login,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        name: AppRouts.homePage,
        path: AppRouts.homePage,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        name: AppRouts.fix,
        path: AppRouts.fix,
        builder: (context, state) => FixScreen(),
      ),
      GoRoute(
        name: AppRouts.rent,
        path: AppRouts.rent,
        builder: (context, state) => RentScreen(),
      ),
      GoRoute(
        name: AppRouts.garage,
        path: AppRouts.garage,
        builder: (context, state) => GarageScreen(),
      ),
      GoRoute(
        name: AppRouts.seeEmpAccounts,
        path: AppRouts.seeEmpAccounts,
        builder: (context, state) => SeeAccountsScreen(),
      ),
      GoRoute(
        name: AppRouts.events,
        path: AppRouts.events,
        builder: (context, state) => EventsScreen(),
      ),
      GoRoute(
        name: AppRouts.bookEventOne,
        path: AppRouts.bookEventOne,
        builder: (context, state) => BookEventOne(),
      ),
      GoRoute(
        name: AppRouts.checkOutRepairCustomerInfo,
        path: AppRouts.checkOutRepairCustomerInfo,
        builder: (context, state) => CheckOutRepairCustomerInfo(),
      ),
      GoRoute(
        name: AppRouts.checkOutRepairDetails,
        path: AppRouts.checkOutRepairDetails,
        builder: (context, state) => CheckOutRepairDetails(),
      ),
      GoRoute(
        name: AppRouts.checkOutRepairConfirm,
        path: AppRouts.checkOutRepairConfirm,
        builder: (context, state) => CheckOutRepairConfirm(),
      ),
      GoRoute(
        name: AppRouts.fixPindingServices,
        path: AppRouts.fixPindingServices,
        builder: (context, state) => FixPindingServices(),
      ),
      GoRoute(
        name: AppRouts.fixHistory,
        path: AppRouts.fixHistory,
        builder: (context, state) => FixHistory(),
      ),
    ],
  );
}
