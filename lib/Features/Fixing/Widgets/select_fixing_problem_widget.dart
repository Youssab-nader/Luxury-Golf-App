import 'package:flutter/material.dart';
import 'package:luxury_golf_app/Features/Fixing/Controllers/fix_service_controller.dart';
import 'package:luxury_golf_app/Features/Fixing/Widgets/fix_section_card.dart';
import 'package:provider/provider.dart';

class SelectExpProblemsWidget extends StatelessWidget {
  const SelectExpProblemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FixServiceController>(
      builder: (
        BuildContext context,
        FixServiceController controller,
        Widget? child,
      ) {
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: controller.allProblems.length,
          itemBuilder:
              (BuildContext context, int index) =>
                  FixSectionCard(problem: controller.allProblems[index]),
        );
      },
    );
  }
}
