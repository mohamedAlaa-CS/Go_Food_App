import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yjahz_app/features/home/data/models/popular_model/datum.dart';
import 'package:yjahz_app/features/home/data/repos/home_repo.dart';

part 'home_popular_state.dart';

class HomePopularCubit extends Cubit<HomePopularState> {
  HomePopularCubit(this.homeRepo) : super(HomePopularInitial());
  final HomeRepo homeRepo;
  static HomePopularCubit get(context) => BlocProvider.of(context);
  List<PopularDataModel> popularDataList = [];

  fecthPopular({
    required double lat,
    required double lng,
  }) async {
    emit(HomePopularLoadingState());
    var result = await homeRepo.fetchHomePopular(lat: lat, lng: lng);

    result.fold((failuer) {
      emit(HomePopularFailuerState(failuer.message));
    }, (popularModel) {
      popularDataList.addAll(popularModel);
      emit(HomePopularSuccessState());
    });
  }
}
