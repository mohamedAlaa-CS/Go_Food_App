import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/theming/spacing.dart';
import 'package:yjahz_app/features/home/presentation/views/widgets/popular_list_view_Item.dart';

class PopularListView extends StatelessWidget {
  const PopularListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 162.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => horzontalMediaSpace(context, 28),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const PopularListViewItem(),
        itemCount: 10,
      ),
    );
  }
}
