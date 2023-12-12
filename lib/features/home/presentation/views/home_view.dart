import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/theming/app_colors.dart';
import 'package:yjahz_app/core/theming/assets.dart';
import 'package:yjahz_app/core/theming/spacing.dart';
import 'package:yjahz_app/core/theming/styles.dart';
import 'package:yjahz_app/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:yjahz_app/features/home/presentation/views/widgets/popular_list_view.dart';
import 'package:yjahz_app/features/home/presentation/views/widgets/search_section.dart';
import 'package:yjahz_app/features/home/presentation/views/widgets/tranding_list_view.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  static const String routeName = '/home_view';
  var searchController = TextEditingController();

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Styles.font24W600.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              const AssetImage(
                Assets.shoppingIconImage,
              ),
              size: 28.sp,
            ),
          ),
          IconButton(
              padding: EdgeInsets.only(right: 10.w, left: 11.w),
              onPressed: () {},
              icon: ImageIcon(
                const AssetImage(
                  Assets.categoryIconImage,
                ),
                size: 27.sp,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w, top: 24.h, bottom: 1.h),
              child: Text(
                'Hello Ahmed',
                style: Styles.font18W500.copyWith(fontSize: 24.sp),
              ),
            ),
            Row(
              children: [
                horzontalMediaSpace(context, 15),
                Text(
                  'Riyadh ( 15 -Jasmine neighbo...',
                  style: Styles.font16W300.copyWith(fontSize: 20.sp),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primary,
                )
              ],
            ),
            SearchSection(
              searchController: searchController,
              filterPressd: () {},
              searchPressd: () {},
            ),
            // verticalSpace(24),
            Padding(
              padding: EdgeInsets.only(
                left: media.width / 12,
                top: media.height / 50,
                bottom: media.height / 60,
              ),
              // padding: EdgeInsets.only(left: 34.w, top: 24.h, bottom: 18.h),
              child: Text(
                'Categories.',
                style: Styles.font18W500,
              ),
            ),
            const CategoryListView(),
            Padding(
              padding: EdgeInsets.only(
                left: media.width / 15,
                top: media.height / 40,
                bottom: media.height / 35,
              ),
              // padding: EdgeInsets.only(left: 29.w, top: 31.h, bottom: 28.h),
              child: Text(
                'Popular now.',
                style: Styles.font18W500,
              ),
            ),
            const PopularListView(),
            Padding(
              padding: EdgeInsets.only(
                left: media.width / 17,
                top: media.height / 35,
                bottom: media.height / 40,
              ),
              // padding: EdgeInsets.only(left: 25.w, top: 32.h, bottom: 18.h),
              child: Text(
                'Trending now.',
                style: Styles.font18W500,
              ),
            ),
            const TrendingListview()
          ],
        ),
      ),
    );
  }
}
