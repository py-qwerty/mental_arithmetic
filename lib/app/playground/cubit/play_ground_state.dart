import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mental_arithmetic/app/playground/widgets/display/cubit/display_cubit.dart';

import '../widgets/numericKeyPad/cubit/numerickeypad_cubit.dart';
part 'play_ground_state.freezed.dart';



enum OperationMode{
  addition,
  subtraction,
  multiplication,
  division,
  mixed,
  percentage,
  bigNumber,
}

enum PlayMode{
  maxOperations,
  maxTime,
  maxScore,
  maxCorrect,
  maxWrong,
  maxTotal,
  maxDigits,
  minDigits,
  numSum,
}



@freezed
class PlayGroundState with _$PlayGroundState{
  const factory PlayGroundState({
    @Default([]) List<DisplayCubit> operations,
    required NumerickeypadCubit numerickeypadCubit,
    @Default(OperationMode.addition) OperationMode operationMode,
    @Default(PlayMode.maxOperations) PlayMode playMode,

    required PageController pageController,
    @Default(true) bool isPlaying,
    @Default(10) int maxOperations,
    @Default(0) int time,
    @Default(0) int score,
    @Default(0) int correct,
    @Default(0) int wrong,
    @Default(0) int total,
    @Default(0) int maxDigits,
    @Default(0) int minDigits,
    @Default(3) int numSum,
  }) = _PlayGroundState;

  const PlayGroundState._();
}
