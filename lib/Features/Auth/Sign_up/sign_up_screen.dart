import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/core/Models/user_model.dart';
import 'package:luxury_golf_app/core/Widgets/buttom_widget.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/Widgets/text_field_widget.dart';
import 'package:luxury_golf_app/core/routing/app_routs.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

//TODO : Change Validation To Regulaer Expression Validation
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _phoneNumController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: AppColors.rGBlue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HightSpacing(hight: 63),
            Image.asset('assets/images/Logo.png', width: 190.w, height: 190.h),
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
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Don\'t have account ? No problem !',
                          style: AppTextStyles.blue101w400s16.copyWith(
                            color: Color(0xff001149),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        HightSpacing(hight: 24),
                        TextFieldWidget(
                          labelText: 'Name',
                          hintText: 'user@email.com',
                          textController: _nameController,
                          validationString: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Enter Employee Name';
                            }
                            return null;
                          },
                        ),
                        HightSpacing(hight: 10),
                        TextFieldWidget(
                          labelText: 'Email',
                          hintText: 'user@email.com',
                          textController: _emailController,
                          validationString: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Enter Employee Email';
                            } else if (!value.contains('@') ||
                                !value.contains('.')) {
                              return 'Not Valid Email , Please Enter Valid Email';
                            }
                            return null;
                          },
                        ),
                        HightSpacing(hight: 10),
                        TextFieldWidget(
                          isPassword: true,
                          labelText: 'Password',
                          hintText: '*********',
                          textController: _passwordController,
                          validationString: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Enter Employee Account Password';
                            } else if (value.trim().length < 8) {
                              return 'Please Enter minimum 8 characters or more';
                            }
                            return null;
                          },
                        ),
                        HightSpacing(hight: 10),
                        TextFieldWidget(
                          isPassword: true,
                          labelText: 'Confirm password',
                          hintText: '*********',
                          validationString: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Re-enter Employee Account Password';
                            } else if (value != _passwordController.text) {
                              return 'Please Re-enter Password Correctly';
                            }
                            return null;
                          },
                        ),

                        HightSpacing(hight: 30),
                        ButtomWidget(
                          text: 'Sign Up',
                          buttomWidth: 343.w,
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                               User user = User(
                                name: _nameController.text,
                                email: _emailController.text,
                                photoURL: null,
                                passWord: _passwordController.text,
                                isLogined: true,
                              );
                              final pref = await SharedPreferences.getInstance();
                              
                            }
                          },
                          buttomhight: 48.h,
                          backgroundColor: Color(0xff3257D1),
                          r: 12,
                        ),
                        HightSpacing(hight: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6B7280),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.pop(AppRouts.login);
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff3257D1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        HightSpacing(hight: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
