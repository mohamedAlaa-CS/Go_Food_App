import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yjahz_app/features/home/data/models/trending_model/datum.dart';
import 'package:yjahz_app/features/home/data/repos/home_repo.dart';

part 'home_trending_state.dart';

class HomeTrendingCubit extends Cubit<HomeTrendingState> {
  HomeTrendingCubit(this.homeRepo) : super(HomeTrendingInitial());
  final HomeRepo homeRepo;
  static HomeTrendingCubit get(context) => BlocProvider.of(context);

  List<TrendingDataModel> trendingDataList = [];

  fetchTrending({
    required double lat,
    required double lng,
  }) async {
    emit(HomeTrendingLoadingState());
    var result = await homeRepo.fetchHomeTrending(lat: lat, lng: lng);
    result.fold((failuer) {
      emit(HomeTrendingFailuerState(failuer.message));
    }, (trendinList) {
      trendingDataList = trendinList;
      emit(HomeTrendingSuccessState());
    });
  }
}
