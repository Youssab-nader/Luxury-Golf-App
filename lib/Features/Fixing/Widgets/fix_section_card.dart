import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luxury_golf_app/Features/Fixing/Controllers/repair_screen_controller.dart';
import 'package:luxury_golf_app/core/Enums/fixing_section_enum.dart';
import 'package:luxury_golf_app/core/Widgets/spacing_widget.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';
import 'package:luxury_golf_app/core/styles/app_styles.dart';
import 'package:provider/provider.dart';

class FixSectionCard extends StatefulWidget {
  final FixingProblemsEnum problem;

  const FixSectionCard({super.key, required this.problem});
  @override
  State<FixSectionCard> createState() => _FixSectionCardState();
}

class _FixSectionCardState extends State<FixSectionCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectExpProblemsController>(
      builder: (
        BuildContext context,
        SelectExpProblemsController controller,
        Widget? child,
      ) {
        bool isTaped = controller.expectedProblems.contains(widget.problem);
        return InkWell(
          child: Container(
            padding: EdgeInsets.all(14.r),
            margin: EdgeInsets.all(3.r),
            decoration: BoxDecoration(
              color: isTaped ? AppColors.blueEFF : AppColors.white,
              border: Border.all(
                color: isTaped ? AppColors.blue155 : AppColors.grey676,
                width: 1.6.r,
              ),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  widget.problem.problemIconPath,
                  colorFilter: ColorFilter.mode(
                    isTaped ? AppColors.blue155 : AppColors.grey4A5,
                    BlendMode.srcIn,
                  ),
                ),
                const HightSpacing(hight: 3),
                Text(
                  widget.problem.problemName,
                  style: AppTextStyles.blue101w400s16.copyWith(
                    fontSize: 14.sp,
                    color: isTaped ? AppColors.blue155 : AppColors.blue101,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            if (isTaped) {
              controller.removeProblem(widget.problem);
            } else {
              controller.addProblem(widget.problem);
            }
            print('The Problems List => ${controller.expectedProblems}');
          },
        );
      },
    );
  }
}
