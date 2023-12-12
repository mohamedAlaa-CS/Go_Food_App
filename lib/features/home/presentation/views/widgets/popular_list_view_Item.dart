import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/theming/app_colors.dart';
import 'package:yjahz_app/core/theming/assets.dart';
import 'package:yjahz_app/core/theming/styles.dart';

import '../../../../../core/widgets/custom_rate.dart';

class PopularListViewItem extends StatelessWidget {
  const PopularListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        children: [
          Image(
            height: 162.h,
            width: 188.w,
            image: const AssetImage(Assets.testBigImage),
            fit: BoxFit.cover,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
            ),
            color: AppColors.primary,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 188.w,
              height: 76.h,
              decoration:
                  BoxDecoration(color: AppColors.textColor.withOpacity(0.4)),
              child: Padding(
                padding: EdgeInsets.only(left: 11.w, bottom: 10.h, top: 7.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Winges',
                      style: Styles.font16W500.copyWith(color: AppColors.beige),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.beige,
                          size: 10.sp,
                        ),
                        Text(
                          ' 15 Km',
                          style: Styles.font12W400.copyWith(
                            fontSize: 8.sp,
                            color: AppColors.beige,
                          ),
                        ),
                      ],
                    ),
                    const CustomRate()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
