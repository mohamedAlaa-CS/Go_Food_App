import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yjahz_app/core/Networking/api_services.dart';
import 'package:yjahz_app/core/Networking/end_point.dart';
import 'package:yjahz_app/core/errors/failuer.dart';

import '../models/user/user_model.dart';
import 'auth_repo.dart';

class AuthRepoImpel implements AuthRepo {
  final ApiServices apiServices;

  AuthRepoImpel(this.apiServices);
  @override
  Future<Either<Failure, UserModel>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      var data = await apiServices.postData(endPoint: LOGIN, data: {
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

  @override
  Future<Either<Failure, UserModel>> userSigup({
    required String name,
    required String email,
    required int phone,
    required String password,
  }) async {
    try {
      var data = await apiServices.postData(endPoint: SIGNUP, data: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password
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
