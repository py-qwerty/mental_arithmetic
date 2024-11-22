import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_tts/flutter_tts.dart';
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
  multiplicationThenAddition, subtractionDivision, multiplicationDivision, additionDivision,
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
    required NumerickeypadCubit numericKeypadCubit,
    @Default(OperationMode.addition) OperationMode operationMode,
    @Default(PlayMode.maxOperations) PlayMode playMode,
    required PageController pageController,
    required FlutterTts tts,
    @Default(0) int currentPage,
    @Default(true) bool isPlaying,

    // results
    @Default({}) Map<String, Map<int, int>> time,
    @Default(0) int timeInMilliseconds,
    @Default(0) int score,
    @Default(0) int correct,
    @Default(0) int wrong,
    @Default(0) int total,

    // config
    @Default(10) int maxOperations,
    @Default(3) int maxDigits,
    @Default(1) int minDigits,
    @Default(3) int numSum,

    //Time config
    required DateTime startTime,
    @Default(Duration.zero) Duration elapse,
    @Default(false) bool isRunning,



    // TTS config
    @Default(1.0) double volume,
    @Default(1) double pitch,
    @Default(0.5) double rate,
    @Default(false) bool withVoice,
    @Default(false) bool hide,

  }) = _PlayGroundState;

  const PlayGroundState._();


  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;
}
