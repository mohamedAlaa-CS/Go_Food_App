import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yjahz_app/core/Networking/api_services.dart';
import 'package:yjahz_app/core/Networking/end_point.dart';
import 'package:yjahz_app/core/errors/failuer.dart';
import 'package:yjahz_app/features/log%20in/data/models/user/user_model.dart';
import 'package:yjahz_app/features/log%20in/data/repos/auth_repo.dart';

class AuthRepoImpel implements AuthRepo {
  final ApiServices apiServices;

  AuthRepoImpel(this.apiServices);
  @override
  Future<Either<Failure, UserModel>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      var data = await apiServices.getData(endPoint: LOGIN, query: {
        'email': email,
        'password': password,
      });
      return right(UserModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
