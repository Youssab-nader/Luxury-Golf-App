import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/Features/Auth/Sign_in/google_sign_in.dart';
import 'package:luxury_golf_app/core/Widgets/buttom_widget.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/Widgets/text_field_widget.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            // color: Colors.amber,
            gradient: AppColors.rGBlue,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HightSpacing(hight: 63),
              Image.asset(
                'assets/images/Logo.png',
                width: 190.w,
                height: 190.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff111827),
                    ),
                  ),
                  Text(
                    ' Luxury Golf !',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff3257D1),
                    ),
                  ),
                ],
              ),
              HightSpacing(hight: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    TextFieldWidget(
                      labelText: 'Email',
                      hintText: 'user@email.com',
                    ),
                    HightSpacing(hight: 16),
                    TextFieldWidget(
                      isPassword: true,
                      labelText: 'Password',
                      hintText: '*********',
                    ),
                    Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password ?',
                          style: AppTextStyles.hyperTextStyle,
                        ),
                      ),
                    ),
                    HightSpacing(hight: 30),
                    ButtomWidget(
                      text: 'Login',
                      buttomWidth: 343.w,
                      onPressed: () {},
                      buttomhight: 48.h,
                      backgroundColor: Color(0xff3257D1),
                      r: 12,
                    ),
                    HightSpacing(hight: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 155.w,
                          child: Divider(color: AppColors.black),
                        ),

                        Text(
                          'or',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyADA,
                          ),
                        ),
                        SizedBox(
                          width: 155.w,
                          child: Divider(color: AppColors.black),
                        ),
                      ],
                    ),
                    HightSpacing(hight: 20),
                    ButtomWidget(
                      text: 'Continue with Google ',
                      buttomWidth: 343.w,
                      onPressed: () async {
                        SigninWithGoogle signIn = SigninWithGoogle();
                        final bool succes = await signIn.signIn();
                        if (succes ) {
                          context.goNamed(AppRouts.main);
                        }
                      },
                      buttomhight: 48.h,
                      svgIconPath: 'assets/icons/google_icon.svg',
                      backgroundColor: Color(0xff094D67),
                    ),
                    HightSpacing(hight: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff6B7280),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pushNamed(AppRouts.signUp);
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff3257D1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
