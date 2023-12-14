import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yjahz_app/core/Networking/api_services.dart';
import 'package:yjahz_app/core/Networking/end_point.dart';
import 'package:yjahz_app/core/errors/failuer.dart';
import 'package:yjahz_app/features/home/data/models/trending_model/datum.dart';
import 'package:yjahz_app/features/home/data/repos/home_repo.dart';

import '../models/home category model/datum_category_model.dart';
import '../models/popular_model/datum.dart';

class HomeRepoImpel implements HomeRepo {
  @override
  Future<Either<Failure, List<CategoryData>>> fetchHomeCategory() async {
    try {
      var data = await ApiServices.getData(endPoint: homeCategory);

      List<CategoryData> homeCategoryList = [];
      for (var item in data['data']['data']) {
        homeCategoryList.add(CategoryData.fromJson(item));
      }

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
  Future<Either<Failure, List<PopularDataModel>>> fetchHomePopular({
    required double lat,
    required double lng,
  }) async {
    try {
      var data = await ApiServices.getData(
        endPoint: homePopular,
        query: {
          'lat': lat,
          'lng': lng,
          'filter': '3',
        },
      );
      List<PopularDataModel> popularData = [];
      for (var item in data['data']['data']) {
        popularData.add(PopularDataModel.fromJson(item));
      }
      return right(popularData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<TrendingDataModel>>> fetchHomeTrending(
      {required double lat, required double lng}) async {
    try {
      var data = await ApiServices.getData(endPoint: homeTrending, query: {
        'lat': lat,
        'lng': lng,
        'filter': '1',
      });
      List<TrendingDataModel> trendingDataList = [];
      for (var item in data['data']) {
        trendingDataList.add(TrendingDataModel.fromJson(item));
      }
      return right(trendingDataList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
