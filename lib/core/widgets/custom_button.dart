import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/theming/app_colors.dart';
import 'package:yjahz_app/core/theming/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.height,
      this.onPressed,
      required this.text,
      this.textStyle});
  final double? height;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 61.w),
      child: SizedBox(
        height: height?.h ?? 51.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: onPressed ?? () {},
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: textStyle ??
                  Styles.font24W600.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
