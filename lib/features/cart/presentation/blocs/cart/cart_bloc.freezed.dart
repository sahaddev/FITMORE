// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CartEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartEvent()';
  }
}

/// @nodoc
class $CartEventCopyWith<$Res> {
  $CartEventCopyWith(CartEvent _, $Res Function(CartEvent) __);
}

/// Adds pattern-matching-related methods to [CartEvent].
extension CartEventPatterns on CartEvent {
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
    TResult Function(LoadCart value)? load,
    TResult Function(GetAllCartItems value)? getAllCartItems,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(IncrementQuantity value)? incrementQuantity,
    TResult Function(DecrementQuantity value)? decrementQuantity,
    TResult Function(AddToCart value)? addToCart,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadCart() when load != null:
        return load(_that);
      case GetAllCartItems() when getAllCartItems != null:
        return getAllCartItems(_that);
      case RemoveFromCart() when removeFromCart != null:
        return removeFromCart(_that);
      case IncrementQuantity() when incrementQuantity != null:
        return incrementQuantity(_that);
      case DecrementQuantity() when decrementQuantity != null:
        return decrementQuantity(_that);
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
    required TResult Function(LoadCart value) load,
    required TResult Function(GetAllCartItems value) getAllCartItems,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(IncrementQuantity value) incrementQuantity,
    required TResult Function(DecrementQuantity value) decrementQuantity,
    required TResult Function(AddToCart value) addToCart,
  }) {
    final _that = this;
    switch (_that) {
      case LoadCart():
        return load(_that);
      case GetAllCartItems():
        return getAllCartItems(_that);
      case RemoveFromCart():
        return removeFromCart(_that);
      case IncrementQuantity():
        return incrementQuantity(_that);
      case DecrementQuantity():
        return decrementQuantity(_that);
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
    TResult? Function(LoadCart value)? load,
    TResult? Function(GetAllCartItems value)? getAllCartItems,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(IncrementQuantity value)? incrementQuantity,
    TResult? Function(DecrementQuantity value)? decrementQuantity,
    TResult? Function(AddToCart value)? addToCart,
  }) {
    final _that = this;
    switch (_that) {
      case LoadCart() when load != null:
        return load(_that);
      case GetAllCartItems() when getAllCartItems != null:
        return getAllCartItems(_that);
      case RemoveFromCart() when removeFromCart != null:
        return removeFromCart(_that);
      case IncrementQuantity() when incrementQuantity != null:
        return incrementQuantity(_that);
      case DecrementQuantity() when decrementQuantity != null:
        return decrementQuantity(_that);
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
    TResult Function()? load,
    TResult Function()? getAllCartItems,
    TResult Function(int id)? removeFromCart,
    TResult Function(int id)? incrementQuantity,
    TResult Function(int id)? decrementQuantity,
    TResult Function(CartModel item)? addToCart,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadCart() when load != null:
        return load();
      case GetAllCartItems() when getAllCartItems != null:
        return getAllCartItems();
      case RemoveFromCart() when removeFromCart != null:
        return removeFromCart(_that.id);
      case IncrementQuantity() when incrementQuantity != null:
        return incrementQuantity(_that.id);
      case DecrementQuantity() when decrementQuantity != null:
        return decrementQuantity(_that.id);
      case AddToCart() when addToCart != null:
        return addToCart(_that.item);
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
    required TResult Function() getAllCartItems,
    required TResult Function(int id) removeFromCart,
    required TResult Function(int id) incrementQuantity,
    required TResult Function(int id) decrementQuantity,
    required TResult Function(CartModel item) addToCart,
  }) {
    final _that = this;
    switch (_that) {
      case LoadCart():
        return load();
      case GetAllCartItems():
        return getAllCartItems();
      case RemoveFromCart():
        return removeFromCart(_that.id);
      case IncrementQuantity():
        return incrementQuantity(_that.id);
      case DecrementQuantity():
        return decrementQuantity(_that.id);
      case AddToCart():
        return addToCart(_that.item);
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
    TResult? Function()? getAllCartItems,
    TResult? Function(int id)? removeFromCart,
    TResult? Function(int id)? incrementQuantity,
    TResult? Function(int id)? decrementQuantity,
    TResult? Function(CartModel item)? addToCart,
  }) {
    final _that = this;
    switch (_that) {
      case LoadCart() when load != null:
        return load();
      case GetAllCartItems() when getAllCartItems != null:
        return getAllCartItems();
      case RemoveFromCart() when removeFromCart != null:
        return removeFromCart(_that.id);
      case IncrementQuantity() when incrementQuantity != null:
        return incrementQuantity(_that.id);
      case DecrementQuantity() when decrementQuantity != null:
        return decrementQuantity(_that.id);
      case AddToCart() when addToCart != null:
        return addToCart(_that.item);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadCart implements CartEvent {
  const LoadCart();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadCart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartEvent.load()';
  }
}

/// @nodoc

class GetAllCartItems implements CartEvent {
  const GetAllCartItems();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetAllCartItems);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartEvent.getAllCartItems()';
  }
}

/// @nodoc

class RemoveFromCart implements CartEvent {
  const RemoveFromCart(this.id);

  final int id;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoveFromCartCopyWith<RemoveFromCart> get copyWith =>
      _$RemoveFromCartCopyWithImpl<RemoveFromCart>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoveFromCart &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CartEvent.removeFromCart(id: $id)';
  }
}

/// @nodoc
abstract mixin class $RemoveFromCartCopyWith<$Res>
    implements $CartEventCopyWith<$Res> {
  factory $RemoveFromCartCopyWith(
          RemoveFromCart value, $Res Function(RemoveFromCart) _then) =
      _$RemoveFromCartCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$RemoveFromCartCopyWithImpl<$Res>
    implements $RemoveFromCartCopyWith<$Res> {
  _$RemoveFromCartCopyWithImpl(this._self, this._then);

  final RemoveFromCart _self;
  final $Res Function(RemoveFromCart) _then;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(RemoveFromCart(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class IncrementQuantity implements CartEvent {
  const IncrementQuantity(this.id);

  final int id;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IncrementQuantityCopyWith<IncrementQuantity> get copyWith =>
      _$IncrementQuantityCopyWithImpl<IncrementQuantity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IncrementQuantity &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CartEvent.incrementQuantity(id: $id)';
  }
}

/// @nodoc
abstract mixin class $IncrementQuantityCopyWith<$Res>
    implements $CartEventCopyWith<$Res> {
  factory $IncrementQuantityCopyWith(
          IncrementQuantity value, $Res Function(IncrementQuantity) _then) =
      _$IncrementQuantityCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$IncrementQuantityCopyWithImpl<$Res>
    implements $IncrementQuantityCopyWith<$Res> {
  _$IncrementQuantityCopyWithImpl(this._self, this._then);

  final IncrementQuantity _self;
  final $Res Function(IncrementQuantity) _then;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(IncrementQuantity(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class DecrementQuantity implements CartEvent {
  const DecrementQuantity(this.id);

  final int id;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DecrementQuantityCopyWith<DecrementQuantity> get copyWith =>
      _$DecrementQuantityCopyWithImpl<DecrementQuantity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DecrementQuantity &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CartEvent.decrementQuantity(id: $id)';
  }
}

/// @nodoc
abstract mixin class $DecrementQuantityCopyWith<$Res>
    implements $CartEventCopyWith<$Res> {
  factory $DecrementQuantityCopyWith(
          DecrementQuantity value, $Res Function(DecrementQuantity) _then) =
      _$DecrementQuantityCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DecrementQuantityCopyWithImpl<$Res>
    implements $DecrementQuantityCopyWith<$Res> {
  _$DecrementQuantityCopyWithImpl(this._self, this._then);

  final DecrementQuantity _self;
  final $Res Function(DecrementQuantity) _then;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(DecrementQuantity(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class AddToCart implements CartEvent {
  const AddToCart(this.item);

  final CartModel item;

  /// Create a copy of CartEvent
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
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @override
  String toString() {
    return 'CartEvent.addToCart(item: $item)';
  }
}

/// @nodoc
abstract mixin class $AddToCartCopyWith<$Res>
    implements $CartEventCopyWith<$Res> {
  factory $AddToCartCopyWith(AddToCart value, $Res Function(AddToCart) _then) =
      _$AddToCartCopyWithImpl;
  @useResult
  $Res call({CartModel item});
}

/// @nodoc
class _$AddToCartCopyWithImpl<$Res> implements $AddToCartCopyWith<$Res> {
  _$AddToCartCopyWithImpl(this._self, this._then);

  final AddToCart _self;
  final $Res Function(AddToCart) _then;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
  }) {
    return _then(AddToCart(
      null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as CartModel,
    ));
  }
}

/// @nodoc
mixin _$CartState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CartState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartState()';
  }
}

/// @nodoc
class $CartStateCopyWith<$Res> {
  $CartStateCopyWith(CartState _, $Res Function(CartState) __);
}

/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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
    TResult Function(List<CartModel> cartItems)? loaded,
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
        return loaded(_that.cartItems);
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
    required TResult Function(List<CartModel> cartItems) loaded,
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
        return loaded(_that.cartItems);
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
    TResult? Function(List<CartModel> cartItems)? loaded,
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
        return loaded(_that.cartItems);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements CartState {
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
    return 'CartState.initial()';
  }
}

/// @nodoc

class _Loading implements CartState {
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
    return 'CartState.loading()';
  }
}

/// @nodoc

class _Success implements CartState {
  const _Success({required this.message});

  final String message;

  /// Create a copy of CartState
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
    return 'CartState.success(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
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

  /// Create a copy of CartState
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

class _Failure implements CartState {
  const _Failure({required this.message});

  final String message;

  /// Create a copy of CartState
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
    return 'CartState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
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

  /// Create a copy of CartState
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

class _Loaded implements CartState {
  const _Loaded(final List<CartModel> cartItems) : _cartItems = cartItems;

  final List<CartModel> _cartItems;
  List<CartModel> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  /// Create a copy of CartState
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
                .equals(other._cartItems, _cartItems));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cartItems));

  @override
  String toString() {
    return 'CartState.loaded(cartItems: $cartItems)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({List<CartModel> cartItems});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cartItems = null,
  }) {
    return _then(_Loaded(
      null == cartItems
          ? _self._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartModel>,
    ));
  }
}

// dart format on
