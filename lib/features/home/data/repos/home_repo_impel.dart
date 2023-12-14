import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yjahz_app/core/Networking/api_services.dart';
import 'package:yjahz_app/core/Networking/end_point.dart';
import 'package:yjahz_app/core/errors/failuer.dart';
import 'package:yjahz_app/features/home/data/models/popular_model/popular_model.dart';
import 'package:yjahz_app/features/home/data/repos/home_repo.dart';

import '../models/home category model/datum_category_model.dart';

class HomeRepoImpel implements HomeRepo {
  @override
  Future<Either<Failure, List<CategoryData>>> fetchHomeCategory() async {
    try {
      var data = await ApiServices.getData(endPoint: homeCategory);

      List<CategoryData> homeCategoryList = [];
      for (var item in data['data']['data']) {
        homeCategoryList.add(CategoryData.fromJson(item));
      }

      print(homeCategoryList);
      return right(homeCategoryList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, PopularModel>> fetchHomePopular({
    required double lat,
    required double lng,
  }) async {
    try {
      var data = await ApiServices.getData(endPoint: homePopular, data: {
        'lat': lat,
        'lng': lng,
        'filter': '3',
      });
      // List<PopularData> popularData = [];
      // for (var item in data['data']['data']) {
      //   popularData.add(PopularData.fromJson(item));
      // }
      return right(PopularModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
