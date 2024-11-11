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
mixin _$NumerickeypadState {
  String get value => throw _privateConstructorUsedError;
  bool get enable => throw _privateConstructorUsedError;

  /// Create a copy of NumerickeypadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumerickeypadStateCopyWith<NumerickeypadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumerickeypadStateCopyWith<$Res> {
  factory $NumerickeypadStateCopyWith(
          NumerickeypadState value, $Res Function(NumerickeypadState) then) =
      _$NumerickeypadStateCopyWithImpl<$Res, NumerickeypadState>;
  @useResult
  $Res call({String value, bool enable});
}

/// @nodoc
class _$NumerickeypadStateCopyWithImpl<$Res, $Val extends NumerickeypadState>
    implements $NumerickeypadStateCopyWith<$Res> {
  _$NumerickeypadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumerickeypadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? enable = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NumerickeypadStateImplCopyWith<$Res>
    implements $NumerickeypadStateCopyWith<$Res> {
  factory _$$NumerickeypadStateImplCopyWith(_$NumerickeypadStateImpl value,
          $Res Function(_$NumerickeypadStateImpl) then) =
      __$$NumerickeypadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, bool enable});
}

/// @nodoc
class __$$NumerickeypadStateImplCopyWithImpl<$Res>
    extends _$NumerickeypadStateCopyWithImpl<$Res, _$NumerickeypadStateImpl>
    implements _$$NumerickeypadStateImplCopyWith<$Res> {
  __$$NumerickeypadStateImplCopyWithImpl(_$NumerickeypadStateImpl _value,
      $Res Function(_$NumerickeypadStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NumerickeypadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? enable = null,
  }) {
    return _then(_$NumerickeypadStateImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NumerickeypadStateImpl extends _NumerickeypadState {
  const _$NumerickeypadStateImpl({this.value = '', this.enable = true})
      : super._();

  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final bool enable;

  @override
  String toString() {
    return 'NumerickeypadState(value: $value, enable: $enable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumerickeypadStateImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.enable, enable) || other.enable == enable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, enable);

  /// Create a copy of NumerickeypadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumerickeypadStateImplCopyWith<_$NumerickeypadStateImpl> get copyWith =>
      __$$NumerickeypadStateImplCopyWithImpl<_$NumerickeypadStateImpl>(
          this, _$identity);
}

abstract class _NumerickeypadState extends NumerickeypadState {
  const factory _NumerickeypadState({final String value, final bool enable}) =
      _$NumerickeypadStateImpl;
  const _NumerickeypadState._() : super._();

  @override
  String get value;
  @override
  bool get enable;

  /// Create a copy of NumerickeypadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumerickeypadStateImplCopyWith<_$NumerickeypadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
