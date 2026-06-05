// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductDetailsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductDetailsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductDetailsEvent()';
  }
}

/// @nodoc
class $ProductDetailsEventCopyWith<$Res> {
  $ProductDetailsEventCopyWith(
      ProductDetailsEvent _, $Res Function(ProductDetailsEvent) __);
}

/// Adds pattern-matching-related methods to [ProductDetailsEvent].
extension ProductDetailsEventPatterns on ProductDetailsEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductDetails value)? load,
    TResult Function(FetchProductList value)? fetchProductList,
    TResult Function(ToggleFavorite value)? toggleFavorite,
    TResult Function(AddToCart value)? addToCart,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductDetails() when load != null:
        return load(_that);
      case FetchProductList() when fetchProductList != null:
        return fetchProductList(_that);
      case ToggleFavorite() when toggleFavorite != null:
        return toggleFavorite(_that);
      case AddToCart() when addToCart != null:
        return addToCart(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductDetails value) load,
    required TResult Function(FetchProductList value) fetchProductList,
    required TResult Function(ToggleFavorite value) toggleFavorite,
    required TResult Function(AddToCart value) addToCart,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductDetails():
        return load(_that);
      case FetchProductList():
        return fetchProductList(_that);
      case ToggleFavorite():
        return toggleFavorite(_that);
      case AddToCart():
        return addToCart(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductDetails value)? load,
    TResult? Function(FetchProductList value)? fetchProductList,
    TResult? Function(ToggleFavorite value)? toggleFavorite,
    TResult? Function(AddToCart value)? addToCart,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductDetails() when load != null:
        return load(_that);
      case FetchProductList() when fetchProductList != null:
        return fetchProductList(_that);
      case ToggleFavorite() when toggleFavorite != null:
        return toggleFavorite(_that);
      case AddToCart() when addToCart != null:
        return addToCart(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? load,
    TResult Function()? fetchProductList,
    TResult Function(ProductModel product)? toggleFavorite,
    TResult Function(ProductModel product)? addToCart,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductDetails() when load != null:
        return load(_that.id);
      case FetchProductList() when fetchProductList != null:
        return fetchProductList();
      case ToggleFavorite() when toggleFavorite != null:
        return toggleFavorite(_that.product);
      case AddToCart() when addToCart != null:
        return addToCart(_that.product);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) load,
    required TResult Function() fetchProductList,
    required TResult Function(ProductModel product) toggleFavorite,
    required TResult Function(ProductModel product) addToCart,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductDetails():
        return load(_that.id);
      case FetchProductList():
        return fetchProductList();
      case ToggleFavorite():
        return toggleFavorite(_that.product);
      case AddToCart():
        return addToCart(_that.product);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? load,
    TResult? Function()? fetchProductList,
    TResult? Function(ProductModel product)? toggleFavorite,
    TResult? Function(ProductModel product)? addToCart,
  }) {
    final _that = this;
    switch (_that) {
      case LoadProductDetails() when load != null:
        return load(_that.id);
      case FetchProductList() when fetchProductList != null:
        return fetchProductList();
      case ToggleFavorite() when toggleFavorite != null:
        return toggleFavorite(_that.product);
      case AddToCart() when addToCart != null:
        return addToCart(_that.product);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadProductDetails implements ProductDetailsEvent {
  const LoadProductDetails({required this.id});

  final int id;

  /// Create a copy of ProductDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadProductDetailsCopyWith<LoadProductDetails> get copyWith =>
      _$LoadProductDetailsCopyWithImpl<LoadProductDetails>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadProductDetails &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'ProductDetailsEvent.load(id: $id)';
  }
}

/// @nodoc
abstract mixin class $LoadProductDetailsCopyWith<$Res>
    implements $ProductDetailsEventCopyWith<$Res> {
  factory $LoadProductDetailsCopyWith(
          LoadProductDetails value, $Res Function(LoadProductDetails) _then) =
      _$LoadProductDetailsCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$LoadProductDetailsCopyWithImpl<$Res>
    implements $LoadProductDetailsCopyWith<$Res> {
  _$LoadProductDetailsCopyWithImpl(this._self, this._then);

  final LoadProductDetails _self;
  final $Res Function(LoadProductDetails) _then;

  /// Create a copy of ProductDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(LoadProductDetails(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class FetchProductList implements ProductDetailsEvent {
  const FetchProductList();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FetchProductList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductDetailsEvent.fetchProductList()';
  }
}

/// @nodoc

class ToggleFavorite implements ProductDetailsEvent {
  const ToggleFavorite(this.product);

  final ProductModel product;

  /// Create a copy of ProductDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleFavoriteCopyWith<ToggleFavorite> get copyWith =>
      _$ToggleFavoriteCopyWithImpl<ToggleFavorite>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleFavorite &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'ProductDetailsEvent.toggleFavorite(product: $product)';
  }
}

/// @nodoc
abstract mixin class $ToggleFavoriteCopyWith<$Res>
    implements $ProductDetailsEventCopyWith<$Res> {
  factory $ToggleFavoriteCopyWith(
          ToggleFavorite value, $Res Function(ToggleFavorite) _then) =
      _$ToggleFavoriteCopyWithImpl;
  @useResult
  $Res call({ProductModel product});
}

/// @nodoc
class _$ToggleFavoriteCopyWithImpl<$Res>
    implements $ToggleFavoriteCopyWith<$Res> {
  _$ToggleFavoriteCopyWithImpl(this._self, this._then);

  final ToggleFavorite _self;
  final $Res Function(ToggleFavorite) _then;

  /// Create a copy of ProductDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(ToggleFavorite(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }
}

/// @nodoc

class AddToCart implements ProductDetailsEvent {
  const AddToCart(this.product);

  final ProductModel product;

  /// Create a copy of ProductDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddToCartCopyWith<AddToCart> get copyWith =>
      _$AddToCartCopyWithImpl<AddToCart>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddToCart &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'ProductDetailsEvent.addToCart(product: $product)';
  }
}

/// @nodoc
abstract mixin class $AddToCartCopyWith<$Res>
    implements $ProductDetailsEventCopyWith<$Res> {
  factory $AddToCartCopyWith(AddToCart value, $Res Function(AddToCart) _then) =
      _$AddToCartCopyWithImpl;
  @useResult
  $Res call({ProductModel product});
}

/// @nodoc
class _$AddToCartCopyWithImpl<$Res> implements $AddToCartCopyWith<$Res> {
  _$AddToCartCopyWithImpl(this._self, this._then);

  final AddToCart _self;
  final $Res Function(AddToCart) _then;

  /// Create a copy of ProductDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(AddToCart(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }
}

/// @nodoc
mixin _$ProductDetailsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductDetailsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductDetailsState()';
  }
}

/// @nodoc
class $ProductDetailsStateCopyWith<$Res> {
  $ProductDetailsStateCopyWith(
      ProductDetailsState _, $Res Function(ProductDetailsState) __);
}

/// Adds pattern-matching-related methods to [ProductDetailsState].
extension ProductDetailsStatePatterns on ProductDetailsState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Success() when success != null:
        return success(_that);
      case _Failure() when failure != null:
        return failure(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Loaded value) loaded,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Success():
        return success(_that);
      case _Failure():
        return failure(_that);
      case _Loaded():
        return loaded(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Loaded value)? loaded,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Success() when success != null:
        return success(_that);
      case _Failure() when failure != null:
        return failure(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    TResult Function(
            List<ProductModel> productList, bool isFavorite, bool isInCart)?
        loaded,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Success() when success != null:
        return success(_that.message);
      case _Failure() when failure != null:
        return failure(_that.message);
      case _Loaded() when loaded != null:
        return loaded(_that.productList, _that.isFavorite, _that.isInCart);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
    required TResult Function(
            List<ProductModel> productList, bool isFavorite, bool isInCart)
        loaded,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Success():
        return success(_that.message);
      case _Failure():
        return failure(_that.message);
      case _Loaded():
        return loaded(_that.productList, _that.isFavorite, _that.isInCart);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
    TResult? Function(
            List<ProductModel> productList, bool isFavorite, bool isInCart)?
        loaded,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Success() when success != null:
        return success(_that.message);
      case _Failure() when failure != null:
        return failure(_that.message);
      case _Loaded() when loaded != null:
        return loaded(_that.productList, _that.isFavorite, _that.isInCart);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements ProductDetailsState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductDetailsState.initial()';
  }
}

/// @nodoc

class _Loading implements ProductDetailsState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductDetailsState.loading()';
  }
}

/// @nodoc

class _Success implements ProductDetailsState {
  const _Success({required this.message});

  final String message;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ProductDetailsState.success(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Success(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Failure implements ProductDetailsState {
  const _Failure({required this.message});

  final String message;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ProductDetailsState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) =
      __$FailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$FailureCopyWithImpl<$Res> implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Failure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Loaded implements ProductDetailsState {
  const _Loaded(
      final List<ProductModel> productList, this.isFavorite, this.isInCart)
      : _productList = productList;

  final List<ProductModel> _productList;
  List<ProductModel> get productList {
    if (_productList is EqualUnmodifiableListView) return _productList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productList);
  }

  final bool isFavorite;
  final bool isInCart;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isInCart, isInCart) ||
                other.isInCart == isInCart));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_productList), isFavorite, isInCart);

  @override
  String toString() {
    return 'ProductDetailsState.loaded(productList: $productList, isFavorite: $isFavorite, isInCart: $isInCart)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({List<ProductModel> productList, bool isFavorite, bool isInCart});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productList = null,
    Object? isFavorite = null,
    Object? isInCart = null,
  }) {
    return _then(_Loaded(
      null == productList
          ? _self._productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isInCart
          ? _self.isInCart
          : isInCart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
