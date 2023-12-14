import 'package:dartz/dartz.dart';
import 'package:yjahz_app/core/errors/failuer.dart';
import 'package:yjahz_app/features/home/data/models/popular_model/popular_model.dart';

import '../models/home category model/datum_category_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryData>>> fetchHomeCategory();
  Future<Either<Failure, PopularModel>> fetchHomePopular({
    required double lat,
    required double lng,
  });
}
