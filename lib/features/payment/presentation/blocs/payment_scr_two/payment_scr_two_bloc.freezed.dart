// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_scr_two_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentScrTwoEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PaymentScrTwoEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentScrTwoEvent()';
  }
}

/// @nodoc
class $PaymentScrTwoEventCopyWith<$Res> {
  $PaymentScrTwoEventCopyWith(
      PaymentScrTwoEvent _, $Res Function(PaymentScrTwoEvent) __);
}

/// Adds pattern-matching-related methods to [PaymentScrTwoEvent].
extension PaymentScrTwoEventPatterns on PaymentScrTwoEvent {
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
    TResult Function(LoadPaymentScrTwo value)? load,
    TResult Function(SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(ApplyCoupon value)? applyCoupon,
    TResult Function(ProcessPayment value)? processPayment,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadPaymentScrTwo() when load != null:
        return load(_that);
      case SelectPaymentMethod() when selectPaymentMethod != null:
        return selectPaymentMethod(_that);
      case ApplyCoupon() when applyCoupon != null:
        return applyCoupon(_that);
      case ProcessPayment() when processPayment != null:
        return processPayment(_that);
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
    required TResult Function(LoadPaymentScrTwo value) load,
    required TResult Function(SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(ApplyCoupon value) applyCoupon,
    required TResult Function(ProcessPayment value) processPayment,
  }) {
    final _that = this;
    switch (_that) {
      case LoadPaymentScrTwo():
        return load(_that);
      case SelectPaymentMethod():
        return selectPaymentMethod(_that);
      case ApplyCoupon():
        return applyCoupon(_that);
      case ProcessPayment():
        return processPayment(_that);
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
    TResult? Function(LoadPaymentScrTwo value)? load,
    TResult? Function(SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(ApplyCoupon value)? applyCoupon,
    TResult? Function(ProcessPayment value)? processPayment,
  }) {
    final _that = this;
    switch (_that) {
      case LoadPaymentScrTwo() when load != null:
        return load(_that);
      case SelectPaymentMethod() when selectPaymentMethod != null:
        return selectPaymentMethod(_that);
      case ApplyCoupon() when applyCoupon != null:
        return applyCoupon(_that);
      case ProcessPayment() when processPayment != null:
        return processPayment(_that);
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
    TResult Function(String method)? selectPaymentMethod,
    TResult Function(String code)? applyCoupon,
    TResult Function()? processPayment,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadPaymentScrTwo() when load != null:
        return load();
      case SelectPaymentMethod() when selectPaymentMethod != null:
        return selectPaymentMethod(_that.method);
      case ApplyCoupon() when applyCoupon != null:
        return applyCoupon(_that.code);
      case ProcessPayment() when processPayment != null:
        return processPayment();
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
    required TResult Function(String method) selectPaymentMethod,
    required TResult Function(String code) applyCoupon,
    required TResult Function() processPayment,
  }) {
    final _that = this;
    switch (_that) {
      case LoadPaymentScrTwo():
        return load();
      case SelectPaymentMethod():
        return selectPaymentMethod(_that.method);
      case ApplyCoupon():
        return applyCoupon(_that.code);
      case ProcessPayment():
        return processPayment();
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
    TResult? Function(String method)? selectPaymentMethod,
    TResult? Function(String code)? applyCoupon,
    TResult? Function()? processPayment,
  }) {
    final _that = this;
    switch (_that) {
      case LoadPaymentScrTwo() when load != null:
        return load();
      case SelectPaymentMethod() when selectPaymentMethod != null:
        return selectPaymentMethod(_that.method);
      case ApplyCoupon() when applyCoupon != null:
        return applyCoupon(_that.code);
      case ProcessPayment() when processPayment != null:
        return processPayment();
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadPaymentScrTwo implements PaymentScrTwoEvent {
  const LoadPaymentScrTwo();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadPaymentScrTwo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentScrTwoEvent.load()';
  }
}

/// @nodoc

class SelectPaymentMethod implements PaymentScrTwoEvent {
  const SelectPaymentMethod(this.method);

  final String method;

  /// Create a copy of PaymentScrTwoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectPaymentMethodCopyWith<SelectPaymentMethod> get copyWith =>
      _$SelectPaymentMethodCopyWithImpl<SelectPaymentMethod>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectPaymentMethod &&
            (identical(other.method, method) || other.method == method));
  }

  @override
  int get hashCode => Object.hash(runtimeType, method);

  @override
  String toString() {
    return 'PaymentScrTwoEvent.selectPaymentMethod(method: $method)';
  }
}

/// @nodoc
abstract mixin class $SelectPaymentMethodCopyWith<$Res>
    implements $PaymentScrTwoEventCopyWith<$Res> {
  factory $SelectPaymentMethodCopyWith(
          SelectPaymentMethod value, $Res Function(SelectPaymentMethod) _then) =
      _$SelectPaymentMethodCopyWithImpl;
  @useResult
  $Res call({String method});
}

/// @nodoc
class _$SelectPaymentMethodCopyWithImpl<$Res>
    implements $SelectPaymentMethodCopyWith<$Res> {
  _$SelectPaymentMethodCopyWithImpl(this._self, this._then);

  final SelectPaymentMethod _self;
  final $Res Function(SelectPaymentMethod) _then;

  /// Create a copy of PaymentScrTwoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? method = null,
  }) {
    return _then(SelectPaymentMethod(
      null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ApplyCoupon implements PaymentScrTwoEvent {
  const ApplyCoupon(this.code);

  final String code;

  /// Create a copy of PaymentScrTwoEvent
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
    return 'PaymentScrTwoEvent.applyCoupon(code: $code)';
  }
}

/// @nodoc
abstract mixin class $ApplyCouponCopyWith<$Res>
    implements $PaymentScrTwoEventCopyWith<$Res> {
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

  /// Create a copy of PaymentScrTwoEvent
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

class ProcessPayment implements PaymentScrTwoEvent {
  const ProcessPayment();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProcessPayment);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentScrTwoEvent.processPayment()';
  }
}

/// @nodoc
mixin _$PaymentScrTwoState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PaymentScrTwoState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentScrTwoState()';
  }
}

/// @nodoc
class $PaymentScrTwoStateCopyWith<$Res> {
  $PaymentScrTwoStateCopyWith(
      PaymentScrTwoState _, $Res Function(PaymentScrTwoState) __);
}

/// Adds pattern-matching-related methods to [PaymentScrTwoState].
extension PaymentScrTwoStatePatterns on PaymentScrTwoState {
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
    TResult Function(String selectedMethod)? loaded,
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
        return loaded(_that.selectedMethod);
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
    required TResult Function(String selectedMethod) loaded,
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
        return loaded(_that.selectedMethod);
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
    TResult? Function(String selectedMethod)? loaded,
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
        return loaded(_that.selectedMethod);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements PaymentScrTwoState {
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
    return 'PaymentScrTwoState.initial()';
  }
}

/// @nodoc

class _Loading implements PaymentScrTwoState {
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
    return 'PaymentScrTwoState.loading()';
  }
}

/// @nodoc

class _Success implements PaymentScrTwoState {
  const _Success({required this.message});

  final String message;

  /// Create a copy of PaymentScrTwoState
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
    return 'PaymentScrTwoState.success(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $PaymentScrTwoStateCopyWith<$Res> {
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

  /// Create a copy of PaymentScrTwoState
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

class _Failure implements PaymentScrTwoState {
  const _Failure({required this.message});

  final String message;

  /// Create a copy of PaymentScrTwoState
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
    return 'PaymentScrTwoState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res>
    implements $PaymentScrTwoStateCopyWith<$Res> {
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

  /// Create a copy of PaymentScrTwoState
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

class _Loaded implements PaymentScrTwoState {
  const _Loaded(this.selectedMethod);

  final String selectedMethod;

  /// Create a copy of PaymentScrTwoState
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
            (identical(other.selectedMethod, selectedMethod) ||
                other.selectedMethod == selectedMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedMethod);

  @override
  String toString() {
    return 'PaymentScrTwoState.loaded(selectedMethod: $selectedMethod)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $PaymentScrTwoStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({String selectedMethod});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of PaymentScrTwoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedMethod = null,
  }) {
    return _then(_Loaded(
      null == selectedMethod
          ? _self.selectedMethod
          : selectedMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
