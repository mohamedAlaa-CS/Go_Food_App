part of 'login_cubit.dart';

class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final UserModel model;

  LoginSuccessState(this.model);
}

final class LoginFailuerState extends LoginState {
  final String error;

  LoginFailuerState(this.error);
}

class LoginChangeVisabilityPasswordState extends LoginState {}
