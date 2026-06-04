// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_scr_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentScrEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PaymentScrEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentScrEvent()';
  }
}

/// @nodoc
class $PaymentScrEventCopyWith<$Res> {
  $PaymentScrEventCopyWith(
      PaymentScrEvent _, $Res Function(PaymentScrEvent) __);
}

/// Adds pattern-matching-related methods to [PaymentScrEvent].
extension PaymentScrEventPatterns on PaymentScrEvent {
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
    TResult Function(LoadPaymentScr value)? load,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(ApplyCoupon value)? applyCoupon,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadPaymentScr() when load != null:
        return load(_that);
      case UpdateQuantity() when updateQuantity != null:
        return updateQuantity(_that);
      case ApplyCoupon() when applyCoupon != null:
        return applyCoupon(_that);
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
    required TResult Function(LoadPaymentScr value) load,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(ApplyCoupon value) applyCoupon,
  }) {
    final _that = this;
    switch (_that) {
      case LoadPaymentScr():
        return load(_that);
      case UpdateQuantity():
        return updateQuantity(_that);
      case ApplyCoupon():
        return applyCoupon(_that);
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
    TResult? Function(LoadPaymentScr value)? load,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(ApplyCoupon value)? applyCoupon,
  }) {
    final _that = this;
    switch (_that) {
      case LoadPaymentScr() when load != null:
        return load(_that);
      case UpdateQuantity() when updateQuantity != null:
        return updateQuantity(_that);
      case ApplyCoupon() when applyCoupon != null:
        return applyCoupon(_that);
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
    TResult Function(int quantity)? updateQuantity,
    TResult Function(String code)? applyCoupon,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadPaymentScr() when load != null:
        return load();
      case UpdateQuantity() when updateQuantity != null:
        return updateQuantity(_that.quantity);
      case ApplyCoupon() when applyCoupon != null:
        return applyCoupon(_that.code);
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
    required TResult Function(int quantity) updateQuantity,
    required TResult Function(String code) applyCoupon,
  }) {
    final _that = this;
    switch (_that) {
      case LoadPaymentScr():
        return load();
      case UpdateQuantity():
        return updateQuantity(_that.quantity);
      case ApplyCoupon():
        return applyCoupon(_that.code);
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
    TResult? Function(int quantity)? updateQuantity,
    TResult? Function(String code)? applyCoupon,
  }) {
    final _that = this;
    switch (_that) {
      case LoadPaymentScr() when load != null:
        return load();
      case UpdateQuantity() when updateQuantity != null:
        return updateQuantity(_that.quantity);
      case ApplyCoupon() when applyCoupon != null:
        return applyCoupon(_that.code);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadPaymentScr implements PaymentScrEvent {
  const LoadPaymentScr();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadPaymentScr);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentScrEvent.load()';
  }
}

/// @nodoc

class UpdateQuantity implements PaymentScrEvent {
  const UpdateQuantity(this.quantity);

  final int quantity;

  /// Create a copy of PaymentScrEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateQuantityCopyWith<UpdateQuantity> get copyWith =>
      _$UpdateQuantityCopyWithImpl<UpdateQuantity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateQuantity &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quantity);

  @override
  String toString() {
    return 'PaymentScrEvent.updateQuantity(quantity: $quantity)';
  }
}

/// @nodoc
abstract mixin class $UpdateQuantityCopyWith<$Res>
    implements $PaymentScrEventCopyWith<$Res> {
  factory $UpdateQuantityCopyWith(
          UpdateQuantity value, $Res Function(UpdateQuantity) _then) =
      _$UpdateQuantityCopyWithImpl;
  @useResult
  $Res call({int quantity});
}

/// @nodoc
class _$UpdateQuantityCopyWithImpl<$Res>
    implements $UpdateQuantityCopyWith<$Res> {
  _$UpdateQuantityCopyWithImpl(this._self, this._then);

  final UpdateQuantity _self;
  final $Res Function(UpdateQuantity) _then;

  /// Create a copy of PaymentScrEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? quantity = null,
  }) {
    return _then(UpdateQuantity(
      null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ApplyCoupon implements PaymentScrEvent {
  const ApplyCoupon(this.code);

  final String code;

  /// Create a copy of PaymentScrEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApplyCouponCopyWith<ApplyCoupon> get copyWith =>
      _$ApplyCouponCopyWithImpl<ApplyCoupon>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApplyCoupon &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @override
  String toString() {
    return 'PaymentScrEvent.applyCoupon(code: $code)';
  }
}

/// @nodoc
abstract mixin class $ApplyCouponCopyWith<$Res>
    implements $PaymentScrEventCopyWith<$Res> {
  factory $ApplyCouponCopyWith(
          ApplyCoupon value, $Res Function(ApplyCoupon) _then) =
      _$ApplyCouponCopyWithImpl;
  @useResult
  $Res call({String code});
}

/// @nodoc
class _$ApplyCouponCopyWithImpl<$Res> implements $ApplyCouponCopyWith<$Res> {
  _$ApplyCouponCopyWithImpl(this._self, this._then);

  final ApplyCoupon _self;
  final $Res Function(ApplyCoupon) _then;

  /// Create a copy of PaymentScrEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
  }) {
    return _then(ApplyCoupon(
      null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$PaymentScrState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PaymentScrState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentScrState()';
  }
}

/// @nodoc
class $PaymentScrStateCopyWith<$Res> {
  $PaymentScrStateCopyWith(
      PaymentScrState _, $Res Function(PaymentScrState) __);
}

/// Adds pattern-matching-related methods to [PaymentScrState].
extension PaymentScrStatePatterns on PaymentScrState {
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
    TResult Function(dynamic product, int quantity, num totalPrice)? loaded,
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
        return loaded(_that.product, _that.quantity, _that.totalPrice);
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
    required TResult Function(dynamic product, int quantity, num totalPrice)
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
        return loaded(_that.product, _that.quantity, _that.totalPrice);
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
    TResult? Function(dynamic product, int quantity, num totalPrice)? loaded,
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
        return loaded(_that.product, _that.quantity, _that.totalPrice);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements PaymentScrState {
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
    return 'PaymentScrState.initial()';
  }
}

/// @nodoc

class _Loading implements PaymentScrState {
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
    return 'PaymentScrState.loading()';
  }
}

/// @nodoc

class _Success implements PaymentScrState {
  const _Success({required this.message});

  final String message;

  /// Create a copy of PaymentScrState
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
    return 'PaymentScrState.success(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $PaymentScrStateCopyWith<$Res> {
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

  /// Create a copy of PaymentScrState
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

class _Failure implements PaymentScrState {
  const _Failure({required this.message});

  final String message;

  /// Create a copy of PaymentScrState
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
    return 'PaymentScrState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res>
    implements $PaymentScrStateCopyWith<$Res> {
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

  /// Create a copy of PaymentScrState
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

class _Loaded implements PaymentScrState {
  const _Loaded(this.product, this.quantity, this.totalPrice);

  final dynamic product;
  final int quantity;
  final num totalPrice;

  /// Create a copy of PaymentScrState
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
            const DeepCollectionEquality().equals(other.product, product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(product), quantity, totalPrice);

  @override
  String toString() {
    return 'PaymentScrState.loaded(product: $product, quantity: $quantity, totalPrice: $totalPrice)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $PaymentScrStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({dynamic product, int quantity, num totalPrice});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of PaymentScrState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = freezed,
    Object? quantity = null,
    Object? totalPrice = null,
  }) {
    return _then(_Loaded(
      freezed == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as dynamic,
      null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

// dart format on
