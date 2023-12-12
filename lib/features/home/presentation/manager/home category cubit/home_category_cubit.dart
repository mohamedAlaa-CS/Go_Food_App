import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yjahz_app/features/home/data/models/home%20category%20model/home_category_model.dart';
import 'package:yjahz_app/features/home/data/repos/home_repo.dart';

part 'home_category_state.dart';

class HomeCategoryCubit extends Cubit<HomeCategoryState> {
  HomeCategoryCubit(this.homeRepo) : super(HomeCategoryInitial());
  HomeCategoryCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;

  //! fetch category Data
  List<HomeCategoryModel> homeCategoryData = [];
  fetchHomeCategory() async {
    emit(HomeCategoryLoadingState());

    var result = await homeRepo.fetchHomeCategory();
    result.fold((failuer) {
      emit(HomeCategoryFailuerState(failuer.message));
    }, (categorylist) {
      homeCategoryData.addAll(categorylist);
      emit(HomeCategorySuccessState());
    });
  }
}
