import 'dart:developer';

import 'package:e_commerce/features/home/domain/usecase/home_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/models/product/db_product_model.dart';
import '../../../domain/usecase/product_details_usecase.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(const ProductDetailsState.initial()) {
    on<LoadProductDetails>(_onLoadProductDetails);
    on<FetchProductList>(_onFetchProductList);
    on<ToggleFavorite>(_onToggleFavorite);
    on<AddToCart>(_onAddToCart);
  }

  Future<void> _onLoadProductDetails(
    LoadProductDetails event,
    Emitter<ProductDetailsState> emit,
  ) async {
    print('---------- _onLoadProductDetails triggered for id: ${event.id} ----------');
    emit(const ProductDetailsState.loading());
    try {
      final response = await ProductDetailsUsecase().productById(id: event.id);

      if (response.status == true && response.product != null) {
        final e = response.product!;
        final product = ProductModel(
          title: e.title ?? '',
          discription: e.description ?? '',
          image1: e.image1 ?? '',
          image2: e.image2 ?? '',
          image3: e.image3 ?? '',
          image4: e.image4 ?? '',
          price: e.price ?? 0,
          category: e.category ?? '',
          productCount: 0,
          id: e.id,
          active: e.active ?? true,
        );
        log(product.image1);
        log(product.image2);
        log(product.image3);
        log(product.image4);
        emit(ProductDetailsState.loaded([product], false, false));
      } else {
        emit(const ProductDetailsState.failure(
            message: 'Failed to load product details'));
      }
    } catch (e, stack) {
      print('---------- Error in _onLoadProductDetails: $e ----------');
      print('---------- StackTrace: $stack ----------');
      emit(ProductDetailsState.failure(message: e.toString()));
    }
  }

  Future<void> _onFetchProductList(
    FetchProductList event,
    Emitter<ProductDetailsState> emit,
  ) async {
    bool isFav = false;
    bool inCart = false;

    state.maybeWhen(
      loaded: (productList, isFavorite, isInCart) {
        isFav = isFavorite;
        inCart = isInCart;
      },
      orElse: () {},
    );

    emit(const ProductDetailsState.loading());
    try {
      final response = await HomeUsecase().getAllProduct();

      if (response.status == true && response.datas != null) {
        final products = response.datas!
            .map((e) => ProductModel(
                  title: e.title ?? '',
                  discription: e.description ?? '',
                  image1: '',
                  image2: '',
                  image3: '',
                  image4: '',
                  price: e.price ?? 0,
                  category: e.category ?? '',
                  productCount: 0,
                  id: e.id,
                  active: e.active ?? true,
                ))
            .toList();

        emit(ProductDetailsState.loaded(products, isFav, inCart));
      } else {
        emit(const ProductDetailsState.failure(
            message: 'Failed to fetch product list'));
      }
    } catch (e) {
      emit(ProductDetailsState.failure(message: e.toString()));
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<ProductDetailsState> emit,
  ) async {
    bool isFav = false;
    bool inCart = false;
    List<ProductModel> currentProducts = [];

    state.maybeWhen(
      loaded: (productList, isFavorite, isInCart) {
        currentProducts = productList;
        isFav = isFavorite;
        inCart = isInCart;
      },
      orElse: () {},
    );

    emit(const ProductDetailsState.loading());
    try {
      isFav = !isFav;

      emit(const ProductDetailsState.success(message: 'Favorite toggled'));
      emit(ProductDetailsState.loaded(currentProducts, isFav, inCart));
    } catch (e, stacktrace) {
      print('---------- Error in _onLoadProductDetails: $e ----------');
      print('---------- Stacktrace: $stacktrace ----------');
      emit(ProductDetailsState.failure(message: e.toString()));
    }
  }

  Future<void> _onAddToCart(
    AddToCart event,
    Emitter<ProductDetailsState> emit,
  ) async {
    bool isFav = false;
    bool inCart = false;
    List<ProductModel> currentProducts = [];

    state.maybeWhen(
      loaded: (productList, isFavorite, isInCart) {
        currentProducts = productList;
        isFav = isFavorite;
        inCart = isInCart;
      },
      orElse: () {},
    );

    emit(const ProductDetailsState.loading());
    try {
      inCart = true;

      emit(const ProductDetailsState.success(message: 'Added to cart'));
      emit(ProductDetailsState.loaded(currentProducts, isFav, inCart));
    } catch (e) {
      emit(ProductDetailsState.failure(message: e.toString()));
    }
  }
}
