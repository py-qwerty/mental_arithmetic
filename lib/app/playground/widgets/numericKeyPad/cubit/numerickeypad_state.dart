

import 'package:freezed_annotation/freezed_annotation.dart';
part 'numerickeypad_state.freezed.dart';

@freezed
class NumerickeypadState with _$NumerickeypadState {
  const factory NumerickeypadState({
    @Default('') String value,
    @Default(true) bool enable,
  }) = _NumerickeypadState;
  const NumerickeypadState._();

}