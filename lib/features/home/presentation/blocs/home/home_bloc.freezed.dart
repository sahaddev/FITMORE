// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeEvent {
  String? get search;
  String? get category;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeEventCopyWith<HomeEvent> get copyWith =>
      _$HomeEventCopyWithImpl<HomeEvent>(this as HomeEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeEvent &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search, category);

  @override
  String toString() {
    return 'HomeEvent(search: $search, category: $category)';
  }
}

/// @nodoc
abstract mixin class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) _then) =
      _$HomeEventCopyWithImpl;
  @useResult
  $Res call({String? search, String? category});
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._self, this._then);

  final HomeEvent _self;
  final $Res Function(HomeEvent) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? category = freezed,
  }) {
    return _then(_self.copyWith(
      search: freezed == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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
    TResult Function(FetchData value)? fetchData,
    TResult Function(RefreshData value)? refreshData,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FetchData() when fetchData != null:
        return fetchData(_that);
      case RefreshData() when refreshData != null:
        return refreshData(_that);
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
    required TResult Function(FetchData value) fetchData,
    required TResult Function(RefreshData value) refreshData,
  }) {
    final _that = this;
    switch (_that) {
      case FetchData():
        return fetchData(_that);
      case RefreshData():
        return refreshData(_that);
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
    TResult? Function(FetchData value)? fetchData,
    TResult? Function(RefreshData value)? refreshData,
  }) {
    final _that = this;
    switch (_that) {
      case FetchData() when fetchData != null:
        return fetchData(_that);
      case RefreshData() when refreshData != null:
        return refreshData(_that);
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
    TResult Function(String? search, String? category)? fetchData,
    TResult Function(String? search, String? category)? refreshData,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FetchData() when fetchData != null:
        return fetchData(_that.search, _that.category);
      case RefreshData() when refreshData != null:
        return refreshData(_that.search, _that.category);
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
    required TResult Function(String? search, String? category) fetchData,
    required TResult Function(String? search, String? category) refreshData,
  }) {
    final _that = this;
    switch (_that) {
      case FetchData():
        return fetchData(_that.search, _that.category);
      case RefreshData():
        return refreshData(_that.search, _that.category);
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
    TResult? Function(String? search, String? category)? fetchData,
    TResult? Function(String? search, String? category)? refreshData,
  }) {
    final _that = this;
    switch (_that) {
      case FetchData() when fetchData != null:
        return fetchData(_that.search, _that.category);
      case RefreshData() when refreshData != null:
        return refreshData(_that.search, _that.category);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FetchData implements HomeEvent {
  const FetchData({this.search, this.category});

  @override
  final String? search;
  @override
  final String? category;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FetchDataCopyWith<FetchData> get copyWith =>
      _$FetchDataCopyWithImpl<FetchData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchData &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search, category);

  @override
  String toString() {
    return 'HomeEvent.fetchData(search: $search, category: $category)';
  }
}

/// @nodoc
abstract mixin class $FetchDataCopyWith<$Res>
    implements $HomeEventCopyWith<$Res> {
  factory $FetchDataCopyWith(FetchData value, $Res Function(FetchData) _then) =
      _$FetchDataCopyWithImpl;
  @override
  @useResult
  $Res call({String? search, String? category});
}

/// @nodoc
class _$FetchDataCopyWithImpl<$Res> implements $FetchDataCopyWith<$Res> {
  _$FetchDataCopyWithImpl(this._self, this._then);

  final FetchData _self;
  final $Res Function(FetchData) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? search = freezed,
    Object? category = freezed,
  }) {
    return _then(FetchData(
      search: freezed == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class RefreshData implements HomeEvent {
  const RefreshData({this.search, this.category});

  @override
  final String? search;
  @override
  final String? category;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RefreshDataCopyWith<RefreshData> get copyWith =>
      _$RefreshDataCopyWithImpl<RefreshData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RefreshData &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search, category);

  @override
  String toString() {
    return 'HomeEvent.refreshData(search: $search, category: $category)';
  }
}

/// @nodoc
abstract mixin class $RefreshDataCopyWith<$Res>
    implements $HomeEventCopyWith<$Res> {
  factory $RefreshDataCopyWith(
          RefreshData value, $Res Function(RefreshData) _then) =
      _$RefreshDataCopyWithImpl;
  @override
  @useResult
  $Res call({String? search, String? category});
}

/// @nodoc
class _$RefreshDataCopyWithImpl<$Res> implements $RefreshDataCopyWith<$Res> {
  _$RefreshDataCopyWithImpl(this._self, this._then);

  final RefreshData _self;
  final $Res Function(RefreshData) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? search = freezed,
    Object? category = freezed,
  }) {
    return _then(RefreshData(
      search: freezed == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$HomeState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState()';
  }
}

/// @nodoc
class $HomeStateCopyWith<$Res> {
  $HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}

/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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
            List<HomeProductModel> popularProducts, List<BannerEntity> banners)?
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
        return loaded(_that.popularProducts, _that.banners);
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
            List<HomeProductModel> popularProducts, List<BannerEntity> banners)
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
        return loaded(_that.popularProducts, _that.banners);
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
            List<HomeProductModel> popularProducts, List<BannerEntity> banners)?
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
        return loaded(_that.popularProducts, _that.banners);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements HomeState {
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
    return 'HomeState.initial()';
  }
}

/// @nodoc

class _Loading implements HomeState {
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
    return 'HomeState.loading()';
  }
}

/// @nodoc

class _Success implements HomeState {
  const _Success({required this.message});

  final String message;

  /// Create a copy of HomeState
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
    return 'HomeState.success(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
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

  /// Create a copy of HomeState
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

class _Failure implements HomeState {
  const _Failure({required this.message});

  final String message;

  /// Create a copy of HomeState
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
    return 'HomeState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
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

  /// Create a copy of HomeState
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

class _Loaded implements HomeState {
  const _Loaded(final List<HomeProductModel> popularProducts,
      final List<BannerEntity> banners)
      : _popularProducts = popularProducts,
        _banners = banners;

  final List<HomeProductModel> _popularProducts;
  List<HomeProductModel> get popularProducts {
    if (_popularProducts is EqualUnmodifiableListView) return _popularProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularProducts);
  }

  final List<BannerEntity> _banners;
  List<BannerEntity> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  /// Create a copy of HomeState
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
                .equals(other._popularProducts, _popularProducts) &&
            const DeepCollectionEquality().equals(other._banners, _banners));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_popularProducts),
      const DeepCollectionEquality().hash(_banners));

  @override
  String toString() {
    return 'HomeState.loaded(popularProducts: $popularProducts, banners: $banners)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {List<HomeProductModel> popularProducts, List<BannerEntity> banners});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? popularProducts = null,
    Object? banners = null,
  }) {
    return _then(_Loaded(
      null == popularProducts
          ? _self._popularProducts
          : popularProducts // ignore: cast_nullable_to_non_nullable
              as List<HomeProductModel>,
      null == banners
          ? _self._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerEntity>,
    ));
  }
}

// dart format on
