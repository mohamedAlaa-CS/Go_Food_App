import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yjahz_app/features/home/data/repos/home_repo.dart';

import '../../../data/models/home category model/datum_category_model.dart';

part 'home_category_state.dart';

class HomeCategoryCubit extends Cubit<HomeCategoryState> {
  HomeCategoryCubit(this.homeRepo) : super(HomeCategoryInitial());
  static HomeCategoryCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;

  //! fetch category Data
  List<Datum> homeCategoryData = [];
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
