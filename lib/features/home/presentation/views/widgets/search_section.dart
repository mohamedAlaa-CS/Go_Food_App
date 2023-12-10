import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/assets.dart';
import '../../../../../core/widgets/app_text_form.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
    required this.searchController,
    required this.filterPressd,
    required this.searchPressd,
  });
  final TextEditingController searchController;
  final VoidCallback filterPressd;
  final VoidCallback searchPressd;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 26.w, top: 29.h),
      child: Row(
        children: [
          Expanded(
            child: AppTextForm(
              hintText: 'Search for fav food ...',
              controller: searchController,
            ),
          ),
          InkWell(
            onTap: searchPressd,
            child: Container(
              margin: EdgeInsets.only(left: 6.w, right: 17.w),
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: AppColors.primary),
              child: Center(
                child: Icon(
                  Icons.search,
                  size: 26.sp,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: filterPressd,
            child: ImageIcon(
              const AssetImage(Assets.filterIconImage),
              color: AppColors.primary,
              size: 26.sp,
            ),
          )
        ],
      ),
    );
  }
}
