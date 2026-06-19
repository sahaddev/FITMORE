import 'package:e_commerce/features/home/data/model/home_res_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/usecase/home_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<FetchData>(_onFetchData);
    on<RefreshData>(_onRefreshData);
  }

  Future<void> _onFetchData(
    FetchData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    try {
      final response = await HomeUsecase().getAllProduct();

      if (response.status == true && response.datas != null) {
        final products = response.datas!
            .map((e) => HomeProductModel(
                  sId: e.sId,
                  id: e.id,
                  title: e.title ?? '',
                  subTitle: e.subTitle ?? '',
                  description: e.description ?? '',
                  price: e.price ?? 0,
                  category: e.category ?? '',
                  active: e.active ?? true,
                  createdAt: e.createdAt,
                  updatedAt: e.updatedAt,
                  baseImage: e.baseImage,
                  iV: e.iV,
                ))
            .toList();

        emit(HomeState.loaded(products));
      } else {
        emit(const HomeState.failure(message: 'Failed to fetch data'));
      }
    } catch (e) {
      emit(HomeState.failure(message: e.toString()));
    }
  }

  Future<void> _onRefreshData(
    RefreshData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    try {
      final response = await HomeUsecase().getAllProduct();

      if (response.status == true && response.datas != null) {
        final products = response.datas!
            .map((e) => HomeProductModel(
                  sId: e.sId,
                  id: e.id,
                  title: e.title ?? '',
                  subTitle: e.subTitle ?? '',
                  description: e.description ?? '',
                  price: e.price ?? 0,
                  category: e.category ?? '',
                  active: e.active ?? true,
                  createdAt: e.createdAt,
                  updatedAt: e.updatedAt,
                  baseImage: e.baseImage,
                  iV: e.iV,
                ))
            .toList();

        emit(HomeState.loaded(products));
      } else {
        emit(const HomeState.failure(message: 'Failed to refresh data'));
      }
    } catch (e) {
      emit(HomeState.failure(message: e.toString()));
    }
  }
}
