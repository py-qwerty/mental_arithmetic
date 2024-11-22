import 'package:freezed_annotation/freezed_annotation.dart';


part 'display_state.freezed.dart';


enum answerMode{
  correct,
  wrong,
  none,
  white,
}

@freezed
class DisplayState with _$DisplayState {
  const factory DisplayState({
    @Default('32 + 56') String operation,
    @Default('88') String result,
    @Default('') String value,
    @Default('Realiza esta operación') String label,
    @Default(answerMode.none) answerMode mode,
  }) = _DisplayState;

  const DisplayState._();
}
