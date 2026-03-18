import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luxury_golf_app/core/Models/employee_model.dart';
import 'package:luxury_golf_app/core/Models/permissions_model.dart';
import 'package:luxury_golf_app/core/Components/screen_header_widget.dart';
import 'package:luxury_golf_app/core/Widgets/buttom_widget.dart';
import 'package:luxury_golf_app/core/Widgets/clickable_card.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/Widgets/text_field_widget.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';

class AddNewEmpScreen extends StatefulWidget {
  const AddNewEmpScreen({super.key});
  // TODO : Make Validation With Regular Exeprision
  @override
  State<AddNewEmpScreen> createState() => _AddNewEmpScreenState();
}

class _AddNewEmpScreenState extends State<AddNewEmpScreen> {
  final GlobalKey<FormState> _empFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final List<Permissions> permissions = [];
  bool addNewCarSwitcher = false;
  bool seeServReqSwitcher = false;
  bool interactServReqSwitcher = false;
  bool seeReportsSwitcher = false;
  bool createAccountSwitcher = false;
  bool addSparePartSwitcher = false;
  bool editWorkHoursSwitcher = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _empFormKey,
            child: Column(
              children: [
                ScreenHeaderWidget(
                  mainText: 'Add New Employee',
                  subText: 'Create new employee account',
                  color: AppColors.blue615,
                ),
                HightSpacing(hight: 16),
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    width: 343.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.50),
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/person_icon.svg'),
                            WidthSpacing(width: 8.w),
                            Text(
                              'Personal Information',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.grey515,
                              ),
                            ),
                          ],
                        ),
                        HightSpacing(hight: 16),
                        TextFieldWidget(
                          textController: _nameController,
                          labelText: 'Full Name',
                          hintText: ' Ex: Youssab Nader',
                          starIcon: ' *',
                          width: 303,
                          validationString: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Enter Employee Name';
                            }
                            return null;
                          },
                        ),
                        HightSpacing(hight: 10),
                        TextFieldWidget(
                          textController: _phoneNumController,
                          labelText: 'Phone Number',
                          hintText: ' Ex: 01212345678',
                          starIcon: ' *',
                          width: 303,
                          validationString: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Enter Employee Phone Number';
                            } else if (value.trim().length != 11) {
                              return 'Phone Number That You Entered is Not Valid';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                HightSpacing(hight: 16),
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    width: 343.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.50),
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/lock_icon.svg'),
                            WidthSpacing(width: 8.w),
                            Text(
                              'Account Security',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blue044,
                              ),
                            ),
                          ],
                        ),
                        HightSpacing(hight: 16),

                        TextFieldWidget(
                          textController: _emailController,
                          labelText: 'Email ',
                          hintText: ' Ex: user@gmail.com',
                          starIcon: ' *',
                          width: 303,
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
                          textController: _passwordController,
                          labelText: 'Password',
                          starIcon: ' *',
                          hintText: 'Min. 8 characters',
                          isPassword: true,
                          width: 303,
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
                          labelText: 'Confirm Password',
                          hintText: 'Re-enter password',
                          starIcon: ' *',
                          isPassword: true,
                          width: 303,
                          validationString: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Re-enter Employee Account Password';
                            } else if (value != _passwordController.text) {
                              return 'Please Re-enter Password Correctly';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const HightSpacing(hight: 20),
                Container(
                  padding: EdgeInsets.all(20.r),
                  width: 343.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.50),
                        offset: Offset(0, 1),
                        blurRadius: 1,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/secure_icon.svg'),
                          WidthSpacing(width: 8.w),
                          Text(
                            'Permissions and Privacy',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.grey515,
                            ),
                          ),
                        ],
                      ),
                      HightSpacing(hight: 16),
                      ClickableCardWidget(
                        mainText: 'Add New Cars',
                        subTex: 'Register fleet vehicles',
                        svgPath: 'assets/icons/golf_ca_155DFCr_icon.svg',
                        bordersColor: AppColors.blueC6D,
                        containerColor: AppColors.blueEEF,
                        iconColor: AppColors.blueEEF,
                        suffixWidget: Transform.scale(
                          scale: .8,
                          child: Switch(
                            activeTrackColor: AppColors.grey464,
                            padding: EdgeInsets.zero,
                            value: addNewCarSwitcher,
                            onChanged: (value) {
                              setState(() {
                                addNewCarSwitcher = value;
                              });

                              if (value == true) {
                                permissions.add(
                                  Permissions.addAndDeleteCarNewCar,
                                );
                              } else if (permissions.contains(
                                    Permissions.addAndDeleteCarNewCar,
                                  ) &&
                                  (value == false)) {
                                permissions.remove(
                                  Permissions.addAndDeleteCarNewCar,
                                );
                              }
                            },
                          ),
                        ),
                        onPress: () {},
                      ),
                      const HightSpacing(hight: 16),
                      ClickableCardWidget(
                        mainText: 'See Service Requests',
                        subTex: 'See customer requests',
                        svgPath: 'assets/icons/requests_Icon.svg',
                        bordersColor: AppColors.orangeFFD,
                        containerColor: AppColors.orangeFFD,
                        iconColor: AppColors.orangeF54,
                        suffixWidget: Transform.scale(
                          scale: .8,
                          child: Switch(
                            activeTrackColor: AppColors.grey464,
                            padding: EdgeInsets.zero,
                            value: seeServReqSwitcher,
                            onChanged: (value) {
                              setState(() {
                                seeServReqSwitcher = value;
                              });

                              if (value == true) {
                                permissions.add(
                                  Permissions.seeServicesRequests,
                                );
                              } else if (permissions.contains(
                                    Permissions.seeServicesRequests,
                                  ) &&
                                  (value == false)) {
                                permissions.remove(
                                  Permissions.seeServicesRequests,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const HightSpacing(hight: 16),
                      ClickableCardWidget(
                        mainText: 'Interact with request ',
                        subTex: 'Approve / Reject requests',
                        svgPath: 'assets/icons/Interact_icon.svg',
                        bordersColor: AppColors.blue981.withValues(alpha: .4),
                        containerColor: AppColors.blueF2D,
                        iconColor: AppColors.white,
                        suffixWidget: Transform.scale(
                          scale: .8,
                          child: Switch(
                            activeTrackColor: AppColors.grey464,
                            padding: EdgeInsets.zero,
                            value: interactServReqSwitcher,
                            onChanged: (value) {
                              setState(() {
                                interactServReqSwitcher = value;
                              });

                              if (value == true) {
                                permissions.add(
                                  Permissions.actWithServicesRequests,
                                );
                              } else if (permissions.contains(
                                    Permissions.actWithServicesRequests,
                                  ) &&
                                  (value == false)) {
                                permissions.remove(
                                  Permissions.actWithServicesRequests,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const HightSpacing(hight: 16),
                      ClickableCardWidget(
                        mainText: 'Create Accounts',
                        subTex: 'Update,Delete,Add,accounts',
                        svgPath: 'assets/icons/add_emp_icon.svg',
                        bordersColor: AppColors.redFCC,
                        containerColor: AppColors.redFCC,
                        iconColor: AppColors.redE70,
                        suffixWidget: Transform.scale(
                          scale: .8,
                          child: Switch(
                            activeTrackColor: AppColors.grey464,
                            padding: EdgeInsets.zero,
                            value: createAccountSwitcher,
                            onChanged: (value) {
                              setState(() {
                                createAccountSwitcher = value;
                              });

                              if (value == true) {
                                permissions.add(
                                  Permissions.createAndDeleteAccounts,
                                );
                              } else if (permissions.contains(
                                    Permissions.createAndDeleteAccounts,
                                  ) &&
                                  (value == false)) {
                                permissions.remove(
                                  Permissions.createAndDeleteAccounts,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const HightSpacing(hight: 16),
                      ClickableCardWidget(
                        mainText: 'See All Reports',
                        subTex: 'Fleet & financial reports',
                        svgPath: 'assets/icons/repots_icon.svg',
                        bordersColor: AppColors.greenB9F,
                        containerColor: AppColors.greenB9F,
                        iconColor: AppColors.green00A,
                        suffixWidget: Transform.scale(
                          scale: .8,
                          child: Switch(
                            activeTrackColor: AppColors.grey464,
                            padding: EdgeInsets.zero,
                            value: seeReportsSwitcher,
                            onChanged: (value) {
                              setState(() {
                                seeReportsSwitcher = value;
                              });

                              if (value == true) {
                                permissions.add(Permissions.seeServicesReports);
                              } else if (permissions.contains(
                                    Permissions.seeServicesReports,
                                  ) &&
                                  (value == false)) {
                                permissions.remove(
                                  Permissions.seeServicesReports,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const HightSpacing(hight: 16),
                      ClickableCardWidget(
                        mainText: 'Add Spare Parts',
                        subTex: 'Inventory management',
                        svgPath: 'assets/icons/spare_parts_icon.svg',
                        bordersColor: AppColors.blueC6D,
                        containerColor: AppColors.blueE9D,
                        iconColor: AppColors.blue981,
                        suffixWidget: Transform.scale(
                          scale: .8,
                          child: Switch(
                            activeTrackColor: AppColors.grey464,
                            padding: EdgeInsets.zero,
                            value: addSparePartSwitcher,
                            onChanged: (value) {
                              setState(() {
                                addSparePartSwitcher = value;
                              });

                              if (value == true) {
                                permissions.add(Permissions.addSpairParts);
                              } else if (permissions.contains(
                                    Permissions.addSpairParts,
                                  ) &&
                                  (value == false)) {
                                permissions.remove(Permissions.addSpairParts);
                              }
                            },
                          ),
                        ),
                      ),
                      const HightSpacing(hight: 16),
                      ClickableCardWidget(
                        mainText: 'Edit Work Hours',
                        subTex: 'Change Work Hours',
                        svgPath: 'assets/icons/work_hours_icon.svg',
                        bordersColor: AppColors.greenF0F,
                        containerColor: AppColors.greenF0F,
                        iconColor: AppColors.green009,
                        suffixWidget: Transform.scale(
                          scale: .8,
                          child: Switch(
                            activeTrackColor: AppColors.grey464,
                            padding: EdgeInsets.zero,
                            value: editWorkHoursSwitcher,
                            onChanged: (value) {
                              setState(() {
                                editWorkHoursSwitcher = value;
                              });
                              if (value == true) {
                                permissions.add(Permissions.editWorkHours);
                              } else if (permissions.contains(
                                    Permissions.editWorkHours,
                                  ) &&
                                  (value == false)) {
                                permissions.remove(Permissions.editWorkHours);
                              }
                            },
                          ),
                        ),
                      ),
                      const HightSpacing(hight: 16),
                    ],
                  ),
                ),
                const HightSpacing(hight: 16),
                ButtomWidget(
                  text: 'Create Employee Account',
                  r: 14,
                  buttomhight: 52.h,
                  buttomWidth: 312,
                  backgroundColor: AppColors.blue615,
                  onPressed: () async {
                    if ((_empFormKey.currentState?.validate() ?? false) &&
                        (permissions.isNotEmpty)) {
                     
                    }
                  },
                ),
                const HightSpacing(hight: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
