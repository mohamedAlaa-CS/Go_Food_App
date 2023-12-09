import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yjahz_app/features/log%20in/data/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;
  SignupCubit get(context) => BlocProvider.of(context);
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
}
