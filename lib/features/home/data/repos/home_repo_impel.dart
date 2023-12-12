import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yjahz_app/core/Networking/api_services.dart';
import 'package:yjahz_app/core/Networking/end_point.dart';
import 'package:yjahz_app/core/errors/failuer.dart';
import 'package:yjahz_app/features/home/data/models/home%20category%20model/home_category_model.dart';
import 'package:yjahz_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpel implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpel(this.apiServices);
  @override
  Future<Either<Failure, List<HomeCategoryModel>>> fetchHomeCategory() async {
    try {
      var data = await apiServices.getData(endPoint: homeCategory);

      List<HomeCategoryModel> homeCategoryList = [];
      for (var item in data['data']['data']) {
        homeCategoryList.add(HomeCategoryModel.fromJson(item));
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
}
