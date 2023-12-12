import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/theming/spacing.dart';
import 'package:yjahz_app/features/home/presentation/views/widgets/trending_list_view_item.dart';

class TrendingListview extends StatelessWidget {
  const TrendingListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 109.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        separatorBuilder: (context, index) => horzontalMediaSpace(context, 34),
        itemBuilder: (context, index) => const TrendingListViewItem(),
        itemCount: 10,
      ),
    );
  }
}
