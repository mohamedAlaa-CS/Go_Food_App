part of 'signup_cubit.dart';

abstract class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupSuccessState extends SignupState {}

final class SignupFailuerState extends SignupState {
  final String errorMessage;

  SignupFailuerState(this.errorMessage);
}
