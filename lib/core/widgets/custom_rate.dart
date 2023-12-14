import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theming/app_colors.dart';
import '../theming/styles.dart';

class CustomRate extends StatelessWidget {
  const CustomRate({super.key, required this.rate});
  final double? rate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RatingBarIndicator(
            itemPadding: EdgeInsets.only(right: 3.w),
            rating: rate ?? 0,
            itemBuilder: (context, index) => const Icon(
              FontAwesomeIcons.solidStar,
              color: AppColors.beige,
            ),
            itemCount: 5,
            itemSize: 10.0,
            direction: Axis.horizontal,
          ),
          Text(
            ' $rate',
            style: Styles.font16W500
                .copyWith(fontSize: 10.sp, color: AppColors.beige),
          )
        ],
      ),
    );
  }
}
