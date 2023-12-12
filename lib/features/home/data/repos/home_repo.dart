import 'package:dartz/dartz.dart';
import 'package:yjahz_app/core/errors/failuer.dart';
import 'package:yjahz_app/features/home/data/models/home%20category%20model/home_category_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<HomeCategoryModel>>> fetchHomeCategory();
}
