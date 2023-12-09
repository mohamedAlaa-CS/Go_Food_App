part of 'signup_cubit.dart';

abstract class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupSuccessState extends SignupState {
  final UserModel model;

  SignupSuccessState(this.model);
}

final class SignupFailuerState extends SignupState {
  final String errorMessage;

  SignupFailuerState(this.errorMessage);
}

class SignupChangeVisabilityPasswordState extends SignupState {}
