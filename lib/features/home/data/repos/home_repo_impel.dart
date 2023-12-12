import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yjahz_app/core/Networking/api_services.dart';
import 'package:yjahz_app/core/Networking/end_point.dart';
import 'package:yjahz_app/core/errors/failuer.dart';
import 'package:yjahz_app/features/home/data/repos/home_repo.dart';

import '../models/home category model/datum_category_model.dart';

class HomeRepoImpel implements HomeRepo {
  @override
  Future<Either<Failure, List<Datum>>> fetchHomeCategory() async {
    try {
      var data = await ApiServices.getData(endPoint: homeCategory);

      List<Datum> homeCategoryList = [];
      for (var item in data['data']['data']) {
        homeCategoryList.add(Datum.fromJson(item));
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
}
