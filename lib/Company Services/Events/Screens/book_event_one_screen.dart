import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:luxury_golf_app/core/Widgets/slider_bar_widget.dart';

import 'package:luxury_golf_app/core/styling/app_styles.dart';

class BookEventOne extends StatefulWidget {
  const BookEventOne({super.key});

  @override
  State<BookEventOne> createState() => _BookEventOneState();
}

class _BookEventOneState extends State<BookEventOne> {
  int stepsCount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsetsGeometry.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                // stepsCount++;
                context.pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
            Text('Book Event', style: AppTextStyles.blue101w400s16),
            Text('Step $stepsCount of 4', style: AppTextStyles.grey4A5w400s14),
            SliderBarWidget(),
          ],
        ),
      ),
    );
  }
}
