import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/widgets/custom_cached_network_imge.dart';
import 'package:yjahz_app/features/home/data/models/trending_model/datum.dart';

import '../../../../../core/theming/app_colors.dart';

class TrendingListViewItem extends StatelessWidget {
  const TrendingListViewItem({super.key, required this.model});
  final TrendingDataModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.all(12),
      width: 136.w,
      // height: 109.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 8), // changes position of shadow
          ),
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: CustomCachedNetworkImage(
        imageUrl: model.logo ?? '',
        height: double.infinity,
      ),
    );
  }
}
