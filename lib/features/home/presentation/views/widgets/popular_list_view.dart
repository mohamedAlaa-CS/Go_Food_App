import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/theming/spacing.dart';
import 'package:yjahz_app/features/home/presentation/manager/home%20popular%20cubit/home_popular_cubit.dart';
import 'package:yjahz_app/features/home/presentation/views/widgets/popular_list_view_Item.dart';

class PopularListView extends StatelessWidget {
  const PopularListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePopularCubit, HomePopularState>(
      listener: (context, state) {},
      builder: (context, state) {
        print(HomePopularCubit.get(context).popularDataList);
        return SizedBox(
          height: 162.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) =>
                horzontalMediaSpace(context, 28),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => PopularListViewItem(
              model: HomePopularCubit.get(context).popularDataList[index],
            ),
            itemCount: HomePopularCubit.get(context).popularDataList.length,
          ),
        );
      },
    );
  }
}
