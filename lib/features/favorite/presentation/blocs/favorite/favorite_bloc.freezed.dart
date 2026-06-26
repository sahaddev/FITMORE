// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavoriteEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteEvent()';
  }
}

/// @nodoc
class $FavoriteEventCopyWith<$Res> {
  $FavoriteEventCopyWith(FavoriteEvent _, $Res Function(FavoriteEvent) __);
}

/// Adds pattern-matching-related methods to [FavoriteEvent].
extension FavoriteEventPatterns on FavoriteEvent {
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
    TResult Function(LoadFavorite value)? load,
    TResult Function(GetAllFavorites value)? getAllFavorites,
    TResult Function(RemoveFromFavorites value)? removeFromFavorites,
    TResult Function(AddToFavorites value)? addToFavorites,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadFavorite() when load != null:
        return load(_that);
      case GetAllFavorites() when getAllFavorites != null:
        return getAllFavorites(_that);
      case RemoveFromFavorites() when removeFromFavorites != null:
        return removeFromFavorites(_that);
      case AddToFavorites() when addToFavorites != null:
        return addToFavorites(_that);
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
    required TResult Function(LoadFavorite value) load,
    required TResult Function(GetAllFavorites value) getAllFavorites,
    required TResult Function(RemoveFromFavorites value) removeFromFavorites,
    required TResult Function(AddToFavorites value) addToFavorites,
  }) {
    final _that = this;
    switch (_that) {
      case LoadFavorite():
        return load(_that);
      case GetAllFavorites():
        return getAllFavorites(_that);
      case RemoveFromFavorites():
        return removeFromFavorites(_that);
      case AddToFavorites():
        return addToFavorites(_that);
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
    TResult? Function(LoadFavorite value)? load,
    TResult? Function(GetAllFavorites value)? getAllFavorites,
    TResult? Function(RemoveFromFavorites value)? removeFromFavorites,
    TResult? Function(AddToFavorites value)? addToFavorites,
  }) {
    final _that = this;
    switch (_that) {
      case LoadFavorite() when load != null:
        return load(_that);
      case GetAllFavorites() when getAllFavorites != null:
        return getAllFavorites(_that);
      case RemoveFromFavorites() when removeFromFavorites != null:
        return removeFromFavorites(_that);
      case AddToFavorites() when addToFavorites != null:
        return addToFavorites(_that);
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
    TResult Function()? load,
    TResult Function()? getAllFavorites,
    TResult Function(String id)? removeFromFavorites,
    TResult Function(String productId)? addToFavorites,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadFavorite() when load != null:
        return load();
      case GetAllFavorites() when getAllFavorites != null:
        return getAllFavorites();
      case RemoveFromFavorites() when removeFromFavorites != null:
        return removeFromFavorites(_that.id);
      case AddToFavorites() when addToFavorites != null:
        return addToFavorites(_that.productId);
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
    required TResult Function() load,
    required TResult Function() getAllFavorites,
    required TResult Function(String id) removeFromFavorites,
    required TResult Function(String productId) addToFavorites,
  }) {
    final _that = this;
    switch (_that) {
      case LoadFavorite():
        return load();
      case GetAllFavorites():
        return getAllFavorites();
      case RemoveFromFavorites():
        return removeFromFavorites(_that.id);
      case AddToFavorites():
        return addToFavorites(_that.productId);
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
    TResult? Function()? load,
    TResult? Function()? getAllFavorites,
    TResult? Function(String id)? removeFromFavorites,
    TResult? Function(String productId)? addToFavorites,
  }) {
    final _that = this;
    switch (_that) {
      case LoadFavorite() when load != null:
        return load();
      case GetAllFavorites() when getAllFavorites != null:
        return getAllFavorites();
      case RemoveFromFavorites() when removeFromFavorites != null:
        return removeFromFavorites(_that.id);
      case AddToFavorites() when addToFavorites != null:
        return addToFavorites(_that.productId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadFavorite implements FavoriteEvent {
  const LoadFavorite();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadFavorite);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteEvent.load()';
  }
}

/// @nodoc

class GetAllFavorites implements FavoriteEvent {
  const GetAllFavorites();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetAllFavorites);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteEvent.getAllFavorites()';
  }
}

/// @nodoc

class RemoveFromFavorites implements FavoriteEvent {
  const RemoveFromFavorites(this.id);

  final String id;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoveFromFavoritesCopyWith<RemoveFromFavorites> get copyWith =>
      _$RemoveFromFavoritesCopyWithImpl<RemoveFromFavorites>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoveFromFavorites &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'FavoriteEvent.removeFromFavorites(id: $id)';
  }
}

/// @nodoc
abstract mixin class $RemoveFromFavoritesCopyWith<$Res>
    implements $FavoriteEventCopyWith<$Res> {
  factory $RemoveFromFavoritesCopyWith(
          RemoveFromFavorites value, $Res Function(RemoveFromFavorites) _then) =
      _$RemoveFromFavoritesCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$RemoveFromFavoritesCopyWithImpl<$Res>
    implements $RemoveFromFavoritesCopyWith<$Res> {
  _$RemoveFromFavoritesCopyWithImpl(this._self, this._then);

  final RemoveFromFavorites _self;
  final $Res Function(RemoveFromFavorites) _then;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(RemoveFromFavorites(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AddToFavorites implements FavoriteEvent {
  const AddToFavorites(this.productId);

  final String productId;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddToFavoritesCopyWith<AddToFavorites> get copyWith =>
      _$AddToFavoritesCopyWithImpl<AddToFavorites>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddToFavorites &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'FavoriteEvent.addToFavorites(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $AddToFavoritesCopyWith<$Res>
    implements $FavoriteEventCopyWith<$Res> {
  factory $AddToFavoritesCopyWith(
          AddToFavorites value, $Res Function(AddToFavorites) _then) =
      _$AddToFavoritesCopyWithImpl;
  @useResult
  $Res call({String productId});
}

/// @nodoc
class _$AddToFavoritesCopyWithImpl<$Res>
    implements $AddToFavoritesCopyWith<$Res> {
  _$AddToFavoritesCopyWithImpl(this._self, this._then);

  final AddToFavorites _self;
  final $Res Function(AddToFavorites) _then;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(AddToFavorites(
      null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$FavoriteState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavoriteState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteState()';
  }
}

/// @nodoc
class $FavoriteStateCopyWith<$Res> {
  $FavoriteStateCopyWith(FavoriteState _, $Res Function(FavoriteState) __);
}

/// Adds pattern-matching-related methods to [FavoriteState].
extension FavoriteStatePatterns on FavoriteState {
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
    TResult Function(List<FavoriteProductEntity> favoriteItems)? loaded,
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
        return loaded(_that.favoriteItems);
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
    required TResult Function(List<FavoriteProductEntity> favoriteItems) loaded,
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
        return loaded(_that.favoriteItems);
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
    TResult? Function(List<FavoriteProductEntity> favoriteItems)? loaded,
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
        return loaded(_that.favoriteItems);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements FavoriteState {
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
    return 'FavoriteState.initial()';
  }
}

/// @nodoc

class _Loading implements FavoriteState {
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
    return 'FavoriteState.loading()';
  }
}

/// @nodoc

class _Success implements FavoriteState {
  const _Success({required this.message});

  final String message;

  /// Create a copy of FavoriteState
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
    return 'FavoriteState.success(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $FavoriteStateCopyWith<$Res> {
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

  /// Create a copy of FavoriteState
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

class _Failure implements FavoriteState {
  const _Failure({required this.message});

  final String message;

  /// Create a copy of FavoriteState
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
    return 'FavoriteState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res>
    implements $FavoriteStateCopyWith<$Res> {
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

  /// Create a copy of FavoriteState
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

class _Loaded implements FavoriteState {
  const _Loaded(final List<FavoriteProductEntity> favoriteItems)
      : _favoriteItems = favoriteItems;

  final List<FavoriteProductEntity> _favoriteItems;
  List<FavoriteProductEntity> get favoriteItems {
    if (_favoriteItems is EqualUnmodifiableListView) return _favoriteItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteItems);
  }

  /// Create a copy of FavoriteState
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
                .equals(other._favoriteItems, _favoriteItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_favoriteItems));

  @override
  String toString() {
    return 'FavoriteState.loaded(favoriteItems: $favoriteItems)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({List<FavoriteProductEntity> favoriteItems});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? favoriteItems = null,
  }) {
    return _then(_Loaded(
      null == favoriteItems
          ? _self._favoriteItems
          : favoriteItems // ignore: cast_nullable_to_non_nullable
              as List<FavoriteProductEntity>,
    ));
  }
}

// dart format on
