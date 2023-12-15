import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/theming/app_colors.dart';
import 'package:yjahz_app/core/theming/styles.dart';

class AppTextForm extends StatelessWidget {
  const AppTextForm(
      {super.key,
      this.contentPading,
      this.focusedBorder,
      this.enabledBorder,
      this.border,
      this.hintStyle,
      this.fillColor,
      this.suffixIcon,
      this.isobscure,
      required this.hintText,
      required this.controller,
      this.validator,
      this.suffixPressed,
      this.textType});
  final EdgeInsetsGeometry? contentPading;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final IconData? suffixIcon;
  final bool? isobscure;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? suffixPressed;
  final TextInputType? textType;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77.h,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 10,
          offset: Offset(9, 8),
          color: Color(0xff0000000d),
        )
      ]),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        style: Styles.font16W300.copyWith(color: Colors.black),
        validator: validator ??
            (value) {
              return null;
            },
        controller: controller,
        obscureText: isobscure ?? false,
        obscuringCharacter: '*',
        keyboardType: textType,
        decoration: InputDecoration(
          errorStyle: TextStyle(
              fontSize: 11.sp, height: 1.h, fontWeight: FontWeight.bold),
          suffixIcon: InkWell(
            onTap: suffixPressed ?? () {},
            child: Icon(suffixIcon, color: Colors.grey.shade600),
          ),
          hintText: hintText,
          hintStyle: hintStyle ?? Styles.font16W300,
          fillColor: fillColor ?? AppColors.white,
          filled: true,
          contentPadding: contentPading ??
              EdgeInsets.only(top: 18.h, left: 16.w, bottom: 17.h),
          border: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.grey,
                  width: 0.25,
                ),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.grey,
                  width: .25,
                ),
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.grey,
                  width: .25,
                ),
              ),
          errorBorder: OutlineInputBorder(
            //gapPadding: 0,
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: .25,
            ),
          ),
        ),
      ),
    );
  }
}
