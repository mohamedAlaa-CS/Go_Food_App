import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yjahz_app/features/log%20in/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  userLogin({required String email, required String password}) async {
    emit(LoginLoadingState());
    var result = await authRepo.userLogin(email: email, password: password);
    result.fold((failuer) {
      emit(LoginFailuerState(failuer.message));
    }, (loginUser) {
      emit(LoginSuccessState());
    });
  }
}
