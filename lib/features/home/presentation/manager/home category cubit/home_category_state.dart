part of 'home_category_cubit.dart';

sealed class HomeCategoryState {}

final class HomeCategoryInitial extends HomeCategoryState {}

final class HomeCategoryLoadingState extends HomeCategoryState {}

final class HomeCategorySuccessState extends HomeCategoryState {}

final class HomeCategoryFailuerState extends HomeCategoryState {
  final String errorMessage;

  HomeCategoryFailuerState(this.errorMessage);
}
