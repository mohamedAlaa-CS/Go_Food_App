import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/styles.dart';

class CustomTopSide extends StatelessWidget {
  const CustomTopSide({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      height: media.height / 12,
      width: 150.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 50,
              offset: const Offset(0, 5)),
        ],
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: Styles.font24W600,
        ),
      ),
    );
  }
}
