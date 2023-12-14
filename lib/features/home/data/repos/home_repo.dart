import 'package:dartz/dartz.dart';
import 'package:yjahz_app/core/errors/failuer.dart';

import '../models/home category model/datum_category_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryData>>> fetchHomeCategory();
}
