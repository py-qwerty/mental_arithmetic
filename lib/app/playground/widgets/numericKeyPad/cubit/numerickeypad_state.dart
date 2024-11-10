

import 'package:freezed_annotation/freezed_annotation.dart';
part 'numerickeypad_state.freezed.dart';

@freezed
class NumericKeyPadState with _$NumericKeyPadState {
  const factory NumericKeyPadState({
    @Default('') String value,
  }) = _NumericKeyPadState;

  const NumericKeyPadState._();

}