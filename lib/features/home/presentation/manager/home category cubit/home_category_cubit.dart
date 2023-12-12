import 'package:bloc/bloc.dart';

part 'home_category_state.dart';

class HomeCategoryCubit extends Cubit<HomeCategoryState> {
  HomeCategoryCubit() : super(HomeCategoryInitial());
}
