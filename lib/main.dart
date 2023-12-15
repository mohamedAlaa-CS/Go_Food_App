import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yjahz_app/core/Networking/api_services.dart';
import 'package:yjahz_app/core/Routing/app_router.dart';
import 'package:yjahz_app/core/theming/app_theme.dart';
import 'package:yjahz_app/features/home/data/repos/home_repo_impel.dart';
import 'package:yjahz_app/features/home/presentation/manager/home%20category%20cubit/home_category_cubit.dart';
import 'package:yjahz_app/features/home/presentation/manager/home%20popular%20cubit/home_popular_cubit.dart';
import 'package:yjahz_app/features/home/presentation/manager/home%20trending%20cubit/home_trending_cubit.dart';

Future<Position> getPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }
  return await Geolocator.getCurrentPosition().then((value) => value);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Position cl = await getPosition();
  ApiServices.init();
  runApp(MyApp(
    latitude: cl.latitude,
    longitude: cl.longitude,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;

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
            ..fecthPopular(lat: latitude, lng: longitude),
        ),
        BlocProvider(
          create: (context) => HomeTrendingCubit(HomeRepoImpel())
            ..fetchTrending(lat: latitude, lng: longitude),
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
