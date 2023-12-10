import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/spacing.dart';
import 'category_list_view_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 117.h,
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => horzontalMediaSpace(context, 34),
        itemBuilder: (context, index) => const CategoryItem(),
        itemCount: 10,
      ),
    );
  }
}
