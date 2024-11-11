// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'display_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DisplayState {
  String get operation => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  answerMode get mode => throw _privateConstructorUsedError;

  /// Create a copy of DisplayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DisplayStateCopyWith<DisplayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayStateCopyWith<$Res> {
  factory $DisplayStateCopyWith(
          DisplayState value, $Res Function(DisplayState) then) =
      _$DisplayStateCopyWithImpl<$Res, DisplayState>;
  @useResult
  $Res call(
      {String operation,
      String result,
      String value,
      String label,
      answerMode mode});
}

/// @nodoc
class _$DisplayStateCopyWithImpl<$Res, $Val extends DisplayState>
    implements $DisplayStateCopyWith<$Res> {
  _$DisplayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DisplayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = null,
    Object? result = null,
    Object? value = null,
    Object? label = null,
    Object? mode = null,
  }) {
    return _then(_value.copyWith(
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as answerMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisplayStateImplCopyWith<$Res>
    implements $DisplayStateCopyWith<$Res> {
  factory _$$DisplayStateImplCopyWith(
          _$DisplayStateImpl value, $Res Function(_$DisplayStateImpl) then) =
      __$$DisplayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String operation,
      String result,
      String value,
      String label,
      answerMode mode});
}

/// @nodoc
class __$$DisplayStateImplCopyWithImpl<$Res>
    extends _$DisplayStateCopyWithImpl<$Res, _$DisplayStateImpl>
    implements _$$DisplayStateImplCopyWith<$Res> {
  __$$DisplayStateImplCopyWithImpl(
      _$DisplayStateImpl _value, $Res Function(_$DisplayStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DisplayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = null,
    Object? result = null,
    Object? value = null,
    Object? label = null,
    Object? mode = null,
  }) {
    return _then(_$DisplayStateImpl(
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as answerMode,
    ));
  }
}

/// @nodoc

class _$DisplayStateImpl extends _DisplayState {
  const _$DisplayStateImpl(
      {this.operation = '32 + 56',
      this.result = '88',
      this.value = '',
      this.label = 'Realiza esta operación',
      this.mode = answerMode.none})
      : super._();

  @override
  @JsonKey()
  final String operation;
  @override
  @JsonKey()
  final String result;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final answerMode mode;

  @override
  String toString() {
    return 'DisplayState(operation: $operation, result: $result, value: $value, label: $label, mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplayStateImpl &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, operation, result, value, label, mode);

  /// Create a copy of DisplayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplayStateImplCopyWith<_$DisplayStateImpl> get copyWith =>
      __$$DisplayStateImplCopyWithImpl<_$DisplayStateImpl>(this, _$identity);
}

abstract class _DisplayState extends DisplayState {
  const factory _DisplayState(
      {final String operation,
      final String result,
      final String value,
      final String label,
      final answerMode mode}) = _$DisplayStateImpl;
  const _DisplayState._() : super._();

  @override
  String get operation;
  @override
  String get result;
  @override
  String get value;
  @override
  String get label;
  @override
  answerMode get mode;

  /// Create a copy of DisplayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisplayStateImplCopyWith<_$DisplayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
