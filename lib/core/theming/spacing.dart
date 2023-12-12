import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpace(double height) => SizedBox(
      height: height.h,
    );
SizedBox horizontalSpace(double width) => SizedBox(
      width: width.h,
    );
SizedBox verticlMediaSpace(BuildContext context, double height) => SizedBox(
      height: MediaQuery.of(context).size.height / height,
    );
SizedBox horzontalMediaSpace(BuildContext context, double width) => SizedBox(
      width: MediaQuery.of(context).size.width / width,
    );
