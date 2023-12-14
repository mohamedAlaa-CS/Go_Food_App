import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/theming/styles.dart';

import '../../../../../core/theming/app_colors.dart';

class TitleOfSection extends StatelessWidget {
  const TitleOfSection(
      {super.key,
      required this.title,
      required this.allViewClicked,
      this.padding});
  final String title;
  final VoidCallback allViewClicked;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: padding ??
          EdgeInsets.only(
              left: media.width / 12,
              top: media.height / 50,
              bottom: media.height / 60,
              right: media.width / 50),
      // padding: EdgeInsets.only(left: 34.w, top: 24.h, bottom: 18.h),
      child: Row(
        children: [
          Text(
            title,
            style: Styles.font18W500,
          ),
          const Spacer(),
          TextButton(
              onPressed: allViewClicked,
              child: Text(
                'View all',
                style: Styles.font16W500.copyWith(
                  fontSize: 10.sp,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                ),
              ))
        ],
      ),
    );
  }
}
