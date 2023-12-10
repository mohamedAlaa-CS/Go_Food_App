import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/theming/app_colors.dart';
import 'package:yjahz_app/core/theming/assets.dart';
import 'package:yjahz_app/core/theming/spacing.dart';
import 'package:yjahz_app/core/theming/styles.dart';
import 'package:yjahz_app/core/widgets/app_text_form.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  static const String routeName = '/';
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
              onPressed: () {},
              icon: ImageIcon(
                const AssetImage(
                  Assets.categoryIconImage,
                ),
                size: 28.sp,
              ))
        ],
      ),
      body: Column(
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
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 26.w, top: 29.h),
            child: Row(
              children: [
                Expanded(
                  child: AppTextForm(
                    hintText: 'Search for fav food ...',
                    controller: searchController,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 6.w, right: 17.w),
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: AppColors.primary),
                  child: const Icon(Icons.search),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ImageIcon(
                    const AssetImage(Assets.filterIconImage),
                    color: AppColors.primary,
                    size: 26.sp,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
