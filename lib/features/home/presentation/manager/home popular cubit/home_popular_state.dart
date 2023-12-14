part of 'home_popular_cubit.dart';

sealed class HomePopularState {}

final class HomePopularInitial extends HomePopularState {}

final class HomePopularLoadingState extends HomePopularState {}

final class HomePopularSuccessState extends HomePopularState {}

final class HomePopularFailuerState extends HomePopularState {
  final String errorMessege;

  HomePopularFailuerState(this.errorMessege);
}
