import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;
 static SignupCubit get(context) => BlocProvider.of(context);
  userSignup({
    required String name,
    required String email,
    required int phone,
    required String password,
  }) async {
    emit(SignupLoadingState());
    var result = await authRepo.userSigup(
        name: name, email: email, phone: phone, password: password);
    result.fold((failuer) {
      emit(SignupFailuerState(failuer.message));
    }, (userModel) {
      emit(SignupSuccessState());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changeVisablityPassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SignupChangeVisabilityPasswordState());
  }
}
