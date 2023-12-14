import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/theming/app_colors.dart';
import 'package:yjahz_app/core/theming/styles.dart';
import 'package:yjahz_app/core/widgets/custom_cached_network_imge.dart';
import 'package:yjahz_app/features/home/data/models/popular_model/datum.dart';

import '../../../../../core/widgets/custom_rate.dart';

class PopularListViewItem extends StatelessWidget {
  const PopularListViewItem({super.key, required this.model});
  final PopularDataModel model;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        children: [
          CustomCachedNetworkImage(
            imageUrl: model.image ?? '',
            height: 162.h,
            width: 188.w,
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
                  BoxDecoration(color: AppColors.textColor.withOpacity(0.7)),
              child: Padding(
                padding: EdgeInsets.only(left: 11.w, bottom: 10.h, top: 7.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name ?? '',
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
                          ' ${double.parse(model.distance ?? '0') / 1000} Km',
                          style: Styles.font12W400.copyWith(
                            fontSize: 8.sp,
                            color: AppColors.beige,
                          ),
                        ),
                      ],
                    ),
                    CustomRate(
                      rate: double.parse(model.rate ?? '0'),
                    )
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
