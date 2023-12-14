import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/theming/spacing.dart';
import 'package:yjahz_app/features/home/presentation/manager/home%20trending%20cubit/home_trending_cubit.dart';
import 'package:yjahz_app/features/home/presentation/views/widgets/trending_list_view_item.dart';

class TrendingListview extends StatelessWidget {
  const TrendingListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTrendingCubit, HomeTrendingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: 109.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            separatorBuilder: (context, index) =>
                horzontalMediaSpace(context, 34),
            itemBuilder: (context, index) => TrendingListViewItem(
                model: HomeTrendingCubit.get(context).trendingDataList[index]),
            itemCount: HomeTrendingCubit.get(context).trendingDataList.length,
          ),
        );
      },
    );
  }
}
