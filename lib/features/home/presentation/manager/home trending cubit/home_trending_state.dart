part of 'home_trending_cubit.dart';

sealed class HomeTrendingState {}

final class HomeTrendingInitial extends HomeTrendingState {}

final class HomeTrendingLoadingState extends HomeTrendingState {}

final class HomeTrendingSuccessState extends HomeTrendingState {}

final class HomeTrendingFailuerState extends HomeTrendingState {
  final String errorMessage;

  HomeTrendingFailuerState(this.errorMessage);
}
