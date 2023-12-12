import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/features/home/presentation/manager/home%20category%20cubit/home_category_cubit.dart';

import '../../../../../core/theming/spacing.dart';
import 'category_list_view_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCategoryCubit, HomeCategoryState>(
      listener: (context, state) {
        if (state is HomeCategoryFailuerState) {
          print(state.errorMessage);
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 117.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                horzontalMediaSpace(context, 34),
            itemBuilder: (context, index) => CategoryItem(
                model: HomeCategoryCubit.get(context).homeCategoryData[index]),
            itemCount: HomeCategoryCubit.get(context).homeCategoryData.length,
          ),
        );
      },
    );
  }
}
