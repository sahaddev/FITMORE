// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddressEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddressEvent()';
  }
}

/// @nodoc
class $AddressEventCopyWith<$Res> {
  $AddressEventCopyWith(AddressEvent _, $Res Function(AddressEvent) __);
}

/// Adds pattern-matching-related methods to [AddressEvent].
extension AddressEventPatterns on AddressEvent {
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
    TResult Function(LoadAddress value)? load,
    TResult Function(GetAllAddresses value)? getAllAddresses,
    TResult Function(AddAddress value)? addAddress,
    TResult Function(UpdateAddress value)? updateAddress,
    TResult Function(DeleteAddress value)? deleteAddress,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadAddress() when load != null:
        return load(_that);
      case GetAllAddresses() when getAllAddresses != null:
        return getAllAddresses(_that);
      case AddAddress() when addAddress != null:
        return addAddress(_that);
      case UpdateAddress() when updateAddress != null:
        return updateAddress(_that);
      case DeleteAddress() when deleteAddress != null:
        return deleteAddress(_that);
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
    required TResult Function(LoadAddress value) load,
    required TResult Function(GetAllAddresses value) getAllAddresses,
    required TResult Function(AddAddress value) addAddress,
    required TResult Function(UpdateAddress value) updateAddress,
    required TResult Function(DeleteAddress value) deleteAddress,
  }) {
    final _that = this;
    switch (_that) {
      case LoadAddress():
        return load(_that);
      case GetAllAddresses():
        return getAllAddresses(_that);
      case AddAddress():
        return addAddress(_that);
      case UpdateAddress():
        return updateAddress(_that);
      case DeleteAddress():
        return deleteAddress(_that);
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
    TResult? Function(LoadAddress value)? load,
    TResult? Function(GetAllAddresses value)? getAllAddresses,
    TResult? Function(AddAddress value)? addAddress,
    TResult? Function(UpdateAddress value)? updateAddress,
    TResult? Function(DeleteAddress value)? deleteAddress,
  }) {
    final _that = this;
    switch (_that) {
      case LoadAddress() when load != null:
        return load(_that);
      case GetAllAddresses() when getAllAddresses != null:
        return getAllAddresses(_that);
      case AddAddress() when addAddress != null:
        return addAddress(_that);
      case UpdateAddress() when updateAddress != null:
        return updateAddress(_that);
      case DeleteAddress() when deleteAddress != null:
        return deleteAddress(_that);
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
    TResult Function()? getAllAddresses,
    TResult Function(AddressModel address)? addAddress,
    TResult Function(AddressModel address)? updateAddress,
    TResult Function(int id)? deleteAddress,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadAddress() when load != null:
        return load();
      case GetAllAddresses() when getAllAddresses != null:
        return getAllAddresses();
      case AddAddress() when addAddress != null:
        return addAddress(_that.address);
      case UpdateAddress() when updateAddress != null:
        return updateAddress(_that.address);
      case DeleteAddress() when deleteAddress != null:
        return deleteAddress(_that.id);
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
    required TResult Function() getAllAddresses,
    required TResult Function(AddressModel address) addAddress,
    required TResult Function(AddressModel address) updateAddress,
    required TResult Function(int id) deleteAddress,
  }) {
    final _that = this;
    switch (_that) {
      case LoadAddress():
        return load();
      case GetAllAddresses():
        return getAllAddresses();
      case AddAddress():
        return addAddress(_that.address);
      case UpdateAddress():
        return updateAddress(_that.address);
      case DeleteAddress():
        return deleteAddress(_that.id);
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
    TResult? Function()? getAllAddresses,
    TResult? Function(AddressModel address)? addAddress,
    TResult? Function(AddressModel address)? updateAddress,
    TResult? Function(int id)? deleteAddress,
  }) {
    final _that = this;
    switch (_that) {
      case LoadAddress() when load != null:
        return load();
      case GetAllAddresses() when getAllAddresses != null:
        return getAllAddresses();
      case AddAddress() when addAddress != null:
        return addAddress(_that.address);
      case UpdateAddress() when updateAddress != null:
        return updateAddress(_that.address);
      case DeleteAddress() when deleteAddress != null:
        return deleteAddress(_that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadAddress implements AddressEvent {
  const LoadAddress();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadAddress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddressEvent.load()';
  }
}

/// @nodoc

class GetAllAddresses implements AddressEvent {
  const GetAllAddresses();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetAllAddresses);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddressEvent.getAllAddresses()';
  }
}

/// @nodoc

class AddAddress implements AddressEvent {
  const AddAddress(this.address);

  final AddressModel address;

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddAddressCopyWith<AddAddress> get copyWith =>
      _$AddAddressCopyWithImpl<AddAddress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddAddress &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  @override
  String toString() {
    return 'AddressEvent.addAddress(address: $address)';
  }
}

/// @nodoc
abstract mixin class $AddAddressCopyWith<$Res>
    implements $AddressEventCopyWith<$Res> {
  factory $AddAddressCopyWith(
          AddAddress value, $Res Function(AddAddress) _then) =
      _$AddAddressCopyWithImpl;
  @useResult
  $Res call({AddressModel address});
}

/// @nodoc
class _$AddAddressCopyWithImpl<$Res> implements $AddAddressCopyWith<$Res> {
  _$AddAddressCopyWithImpl(this._self, this._then);

  final AddAddress _self;
  final $Res Function(AddAddress) _then;

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address = null,
  }) {
    return _then(AddAddress(
      null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
    ));
  }
}

/// @nodoc

class UpdateAddress implements AddressEvent {
  const UpdateAddress(this.address);

  final AddressModel address;

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateAddressCopyWith<UpdateAddress> get copyWith =>
      _$UpdateAddressCopyWithImpl<UpdateAddress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateAddress &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  @override
  String toString() {
    return 'AddressEvent.updateAddress(address: $address)';
  }
}

/// @nodoc
abstract mixin class $UpdateAddressCopyWith<$Res>
    implements $AddressEventCopyWith<$Res> {
  factory $UpdateAddressCopyWith(
          UpdateAddress value, $Res Function(UpdateAddress) _then) =
      _$UpdateAddressCopyWithImpl;
  @useResult
  $Res call({AddressModel address});
}

/// @nodoc
class _$UpdateAddressCopyWithImpl<$Res>
    implements $UpdateAddressCopyWith<$Res> {
  _$UpdateAddressCopyWithImpl(this._self, this._then);

  final UpdateAddress _self;
  final $Res Function(UpdateAddress) _then;

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address = null,
  }) {
    return _then(UpdateAddress(
      null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
    ));
  }
}

/// @nodoc

class DeleteAddress implements AddressEvent {
  const DeleteAddress(this.id);

  final int id;

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteAddressCopyWith<DeleteAddress> get copyWith =>
      _$DeleteAddressCopyWithImpl<DeleteAddress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteAddress &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'AddressEvent.deleteAddress(id: $id)';
  }
}

/// @nodoc
abstract mixin class $DeleteAddressCopyWith<$Res>
    implements $AddressEventCopyWith<$Res> {
  factory $DeleteAddressCopyWith(
          DeleteAddress value, $Res Function(DeleteAddress) _then) =
      _$DeleteAddressCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DeleteAddressCopyWithImpl<$Res>
    implements $DeleteAddressCopyWith<$Res> {
  _$DeleteAddressCopyWithImpl(this._self, this._then);

  final DeleteAddress _self;
  final $Res Function(DeleteAddress) _then;

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(DeleteAddress(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$AddressState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddressState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddressState()';
  }
}

/// @nodoc
class $AddressStateCopyWith<$Res> {
  $AddressStateCopyWith(AddressState _, $Res Function(AddressState) __);
}

/// Adds pattern-matching-related methods to [AddressState].
extension AddressStatePatterns on AddressState {
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
    TResult Function(List<AddressModel> addresses)? loaded,
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
        return loaded(_that.addresses);
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
    required TResult Function(List<AddressModel> addresses) loaded,
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
        return loaded(_that.addresses);
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
    TResult? Function(List<AddressModel> addresses)? loaded,
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
        return loaded(_that.addresses);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements AddressState {
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
    return 'AddressState.initial()';
  }
}

/// @nodoc

class _Loading implements AddressState {
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
    return 'AddressState.loading()';
  }
}

/// @nodoc

class _Success implements AddressState {
  const _Success({required this.message});

  final String message;

  /// Create a copy of AddressState
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
    return 'AddressState.success(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $AddressStateCopyWith<$Res> {
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

  /// Create a copy of AddressState
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

class _Failure implements AddressState {
  const _Failure({required this.message});

  final String message;

  /// Create a copy of AddressState
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
    return 'AddressState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res>
    implements $AddressStateCopyWith<$Res> {
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

  /// Create a copy of AddressState
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

class _Loaded implements AddressState {
  const _Loaded(final List<AddressModel> addresses) : _addresses = addresses;

  final List<AddressModel> _addresses;
  List<AddressModel> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  /// Create a copy of AddressState
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
                .equals(other._addresses, _addresses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_addresses));

  @override
  String toString() {
    return 'AddressState.loaded(addresses: $addresses)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $AddressStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({List<AddressModel> addresses});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? addresses = null,
  }) {
    return _then(_Loaded(
      null == addresses
          ? _self._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>,
    ));
  }
}

// dart format on
