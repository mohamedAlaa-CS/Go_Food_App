part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final UserModel model;

  const LoginSuccessState(this.model);
}

final class LoginFailuerState extends LoginState {
  final String error;

  const LoginFailuerState(this.error);
}
