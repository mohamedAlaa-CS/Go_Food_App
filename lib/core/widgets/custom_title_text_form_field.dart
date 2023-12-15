import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/styles.dart';

class CustomtitleTextFormField extends StatelessWidget {
  const CustomtitleTextFormField(
      {super.key, required this.text, this.textStyle});
  final String text;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 8.h,
          left: 10.w,
        ),
        child: Text(text, style: textStyle ?? Styles.font18W500),
      ),
    );
  }
}
