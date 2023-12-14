import 'package:dartz/dartz.dart';
import 'package:yjahz_app/core/errors/failuer.dart';
import 'package:yjahz_app/features/home/data/models/popular_model/datum.dart';
import 'package:yjahz_app/features/home/data/models/trending_model/datum.dart';

import '../models/home category model/datum_category_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryData>>> fetchHomeCategory();
  Future<Either<Failure, List<PopularDataModel>>> fetchHomePopular({
    required double lat,
    required double lng,
  });
  Future<Either<Failure, List<TrendingDataModel>>> fetchHomeTrending({
    required double lat,
    required double lng,
  });
}
