// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'numerickeypad_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NumericKeyPadState {
  String get value => throw _privateConstructorUsedError;

  /// Create a copy of NumericKeyPadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumericKeyPadStateCopyWith<NumericKeyPadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumericKeyPadStateCopyWith<$Res> {
  factory $NumericKeyPadStateCopyWith(
          NumericKeyPadState value, $Res Function(NumericKeyPadState) then) =
      _$NumericKeyPadStateCopyWithImpl<$Res, NumericKeyPadState>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$NumericKeyPadStateCopyWithImpl<$Res, $Val extends NumericKeyPadState>
    implements $NumericKeyPadStateCopyWith<$Res> {
  _$NumericKeyPadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumericKeyPadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NumericKeyPadStateImplCopyWith<$Res>
    implements $NumericKeyPadStateCopyWith<$Res> {
  factory _$$NumericKeyPadStateImplCopyWith(_$NumericKeyPadStateImpl value,
          $Res Function(_$NumericKeyPadStateImpl) then) =
      __$$NumericKeyPadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$NumericKeyPadStateImplCopyWithImpl<$Res>
    extends _$NumericKeyPadStateCopyWithImpl<$Res, _$NumericKeyPadStateImpl>
    implements _$$NumericKeyPadStateImplCopyWith<$Res> {
  __$$NumericKeyPadStateImplCopyWithImpl(_$NumericKeyPadStateImpl _value,
      $Res Function(_$NumericKeyPadStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NumericKeyPadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$NumericKeyPadStateImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NumericKeyPadStateImpl extends _NumericKeyPadState {
  const _$NumericKeyPadStateImpl({this.value = ''}) : super._();

  @override
  @JsonKey()
  final String value;

  @override
  String toString() {
    return 'NumericKeyPadState(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumericKeyPadStateImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of NumericKeyPadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumericKeyPadStateImplCopyWith<_$NumericKeyPadStateImpl> get copyWith =>
      __$$NumericKeyPadStateImplCopyWithImpl<_$NumericKeyPadStateImpl>(
          this, _$identity);
}

abstract class _NumericKeyPadState extends NumericKeyPadState {
  const factory _NumericKeyPadState({final String value}) =
      _$NumericKeyPadStateImpl;
  const _NumericKeyPadState._() : super._();

  @override
  String get value;

  /// Create a copy of NumericKeyPadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumericKeyPadStateImplCopyWith<_$NumericKeyPadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
