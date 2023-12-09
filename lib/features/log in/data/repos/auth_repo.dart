import 'package:dartz/dartz.dart';
import 'package:yjahz_app/core/errors/failuer.dart';
import 'package:yjahz_app/features/log%20in/data/models/user/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> userLogin({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserModel>> userSigup({
    required String name,
    required String email,
    required int phone,
    required String password,
  });
}
