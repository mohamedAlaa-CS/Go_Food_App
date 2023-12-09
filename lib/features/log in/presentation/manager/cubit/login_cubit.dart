import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yjahz_app/features/log%20in/data/models/user/user_model.dart';
import 'package:yjahz_app/features/log%20in/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  static LoginCubit get(context) => BlocProvider.of(context);

  userLogin({required String email, required String password}) async {
    emit(LoginLoadingState());
    var result = await authRepo.userLogin(email: email, password: password);
    result.fold((failuer) {
      emit(LoginFailuerState(failuer.message));
    }, (loginUser) {
      emit(LoginSuccessState(loginUser));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changeVisablityPassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(LoginChangeVisabilityPasswordState());
  }
}
