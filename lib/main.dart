import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/Networking/api_services.dart';
import 'package:yjahz_app/core/Routing/app_router.dart';
import 'package:yjahz_app/core/theming/app_theme.dart';
import 'package:yjahz_app/features/home/data/repos/home_repo_impel.dart';
import 'package:yjahz_app/features/home/presentation/manager/home%20category%20cubit/home_category_cubit.dart';
import 'package:yjahz_app/features/home/presentation/manager/home%20popular%20cubit/home_popular_cubit.dart';
import 'package:yjahz_app/features/home/presentation/manager/home%20trending%20cubit/home_trending_cubit.dart';

void main() {
  ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeCategoryCubit(HomeRepoImpel())..fetchHomeCategory(),
        ),
        BlocProvider(
          create: (context) => HomePopularCubit(HomeRepoImpel())
            ..fecthPopular(lat: 29.1931, lng: 30.6421),
        ),
        BlocProvider(
          create: (context) => HomeTrendingCubit(HomeRepoImpel())
            ..fetchTrending(lat: 29.1931, lng: 30.6421),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          theme: appTheme,
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          title: 'Ygahz app',
        ),
      ),
    );
  }
}
