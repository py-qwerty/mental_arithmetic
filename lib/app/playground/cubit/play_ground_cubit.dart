import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mental_arithmetic/app/playground/widgets/display/cubit/display_cubit.dart';
import 'package:mental_arithmetic/app/playground/widgets/numericKeyPad/cubit/numerickeypad_cubit.dart';
import '../view/end_page.dart';
import '../widgets/display/cubit/display_state.dart';
import 'play_ground_state.dart';

class PlayGroundCubit extends Cubit<PlayGroundState> {
  //late final Ticker _ticker;
  PlayGroundCubit() : super(PlayGroundState(
      numericKeypadCubit: NumerickeypadCubit(),
      pageController: PageController(),
      tts: FlutterTts(),
      startTime: DateTime.now(),
  )){
    // _ticker = Ticker(onTick);
    // _ticker.stop();
    initTts();
  }

  // Genera las operaciones para el número seleccionado de displays
  void generateDisplays() {
    final operations = <DisplayCubit>[];
    final Random random = Random();

    for (int i = 0; i < state.maxOperations; i++) {
      final newDisplay = DisplayCubit()
        ..generateOperation(
          numSum: random.nextInt(2) + 2,
          maxDigits: state.maxDigits,
          minDigits: state.minDigits,
          typeOperation: state.operationMode,
        );

      operations.add(newDisplay);
      timerStop();
      timerStart();
    }
    emit(state.copyWith(operations: operations));
    speakTheOperation();
  }

  // Chequea la respuesta del usuario y actualiza el puntaje
  Future<void> checkOperation(String value, {required BuildContext context}) async {
    final currentPage = state.currentPage;
    final currentDisplay = state.operations[currentPage];
    if (kDebugMode) {
      print('currentDisplay: $currentPage');
    }
    // Chequear el resultado y actualizar el puntaje
    currentDisplay.checkResult(value);
    if (currentDisplay.state.mode != answerMode.none) {
        solve(context);

      // Volver a la pantalla de inicio si se completan todas las operaciones
      if (currentPage == state.maxOperations - 1) {
        timerStop();
        await Future.delayed(const Duration(milliseconds: 500));
        Navigator.pushNamedAndRemoveUntil(context, EndPage.route,
        (Route<dynamic> route) => false); // This condition removes all previous routes);
      }
    }

  }

  // Dispose
  @override
  Future<void> close() async {
    // if (_ticker.isTicking) {
    //   _ticker.stop();
    // }
    // _ticker.dispose();
    debugPrint("PlayGroundCubit: close called");
    // Detén cualquier reproducción activa del TTS
    if (state.tts != null) {
      await state.tts.stop();
    }

    state.pageController.dispose(); // Libera el controlador de páginas
    return super.close();
  }



  // Resuelve la operación actual
  Future<void> solve(BuildContext context, {int transitionTime = 400, int waitingTime = 500, bool solve = false}) async{
    // Reset the timer
    timerStop();
    int currentScore = state.score;
    final currentPage = state.currentPage;
    final currentDisplay = state.operations[currentPage];

    if (currentDisplay.state.mode == answerMode.correct) {
      currentScore++;
    } else if (currentDisplay.state.mode == answerMode.wrong) {
      currentScore--;
    }else if(solve){
      currentDisplay.setMode(answerMode.white);
    }
    captureTimeScoreAndOperations();
    emit(state.copyWith(score: currentScore));
    state.numericKeypadCubit.enable(false);
    // Time to show the result
    await Future.delayed(Duration(milliseconds: waitingTime));
    await nextPage(context, time: transitionTime);
    state.numericKeypadCubit.enable(true);
    state.numericKeypadCubit.onClear();
  }

  Future<void> nextPage( BuildContext context,{int time = 400,}) async {

    final currentPage = state.currentPage;
    timerReset();
    final maxOperations = state.maxOperations; // Added null safety

    // If the current page is the last one, don`t do anything
    if (currentPage <= maxOperations - 2) {
      emit(state.copyWith(currentPage: currentPage + 1));
      await state.pageController.nextPage(
        duration: Duration(milliseconds: time),
        curve: Curves.easeInOut,
      );

      // speakTheOperation(currentPage + 1);
    }else{
      timerStop();
      await Future.delayed(const Duration(milliseconds: 500));
      Navigator.pushNamedAndRemoveUntil(
        context,
        EndPage.route,
            (Route<dynamic> route) => false,
      );
    }

    // If this operation i haven't done it yet, start the timer again, in other
    // case, the timer will be stopped
    final currentDisplay = state.operations[state.currentPage];
    if(currentDisplay.state.mode == answerMode.none){
      timerStart();
    }
  }



  Future<void> previousPage() async {
    final currentPage = state.currentPage;
    timerReset();
    if (currentPage > 0) {
      await state.pageController.previousPage( // Added null safety
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      emit(state.copyWith(currentPage: currentPage - 1));

      // If this operation i haven't done it yet, start the timer again, in other
      // case, the timer will be stopped
      final currentDisplay = state.operations[state.currentPage];
      if(currentDisplay.state.mode == answerMode.none){
        timerStart();
      }
    }
  }

  

  String convertOperationToWords(String operation, {String locale = 'es'}) {
    // Define los mapeos para cada idioma
    final Map<String, Map<String, String>> operationMap = {
      'es': { // Español
        '+': 'más',
        '-': 'menos',
        '*': 'por',
        '/': 'entre',
      },
      'en': { // Inglés
        '+': 'plus',
        '-': 'minus',
        '*': 'times',
        '/': 'divided by',
      },
      // Puedes agregar más idiomas aquí
    };

    // Obtén el idioma principal (ej. 'es' de 'es_ES')
    String languageCode = locale;

    // Selecciona el mapeo adecuado, por defecto español
    Map<String, String> selectedMap = operationMap[languageCode] ?? operationMap['es']!;

    // Reemplaza los símbolos con las palabras correspondientes
    String convertedOperation = operation;
    selectedMap.forEach((symbol, word) {
      convertedOperation = convertedOperation.replaceAll(symbol, word);
    });

    return convertedOperation;
  }

  void speakTheOperation() {

    if (state.withVoice) {
      print( 'current page ${state.currentPage} cuenta ${state.operations[state.currentPage].state.operation}');
      String operation = state.operations[state.currentPage].state.operation;
      String operationInWords = convertOperationToWords(operation, locale: 'es');

      state.tts.speak(operationInWords);
    }
  }


  //------------------Timer-------------------//
  void onTick(Duration elapsed) {
    if (isClosed || !state.isRunning) {
      return; // Detén cualquier ejecución si el Cubit ya está cerrado o si no está corriendo.
    }
    final now = DateTime.now();
    final elapsedTime = now.difference(state.startTime);
    emit(state.copyWith(elapse: elapsedTime));
  }



  void timerStart() {
    // emit(state.copyWith(isRunning: true));
    // _ticker.start();
  }

  void timerStop() {
    // emit(state.copyWith(isRunning: false));
    // _ticker.stop();
  }

  void timerReset() {
    // _ticker.stop();
    // emit(state.copyWith(elapse: Duration.zero,
    //     isRunning: false,
    //     startTime: DateTime.now()));
  }

  //----------------- TTS -------------------//

  Future<void> _speak(String text) async {
    await state.tts.setVolume(state.volume);
    await state.tts.setSpeechRate(state.rate);
    await state.tts.setPitch(state.pitch);
    await state.tts.speak(text);
  }

  Future<void> _stop() async {
    await state.tts.stop();
  }

  Future<void> _pause() async {
    await state.tts.pause();
  }

  Future<void> _setAwaitOptions() async {
    await state.tts.awaitSpeakCompletion(true);
  }

  Future<void> _getDefaultEngine() async {
    var engine = await state.tts.getDefaultEngine;
    if (engine != null && kDebugMode) {
      if (kDebugMode) {
        print(engine);
      }
    }
  }

  Future<void> _getDefaultVoice() async {
    var voice = await state.tts.getDefaultVoice;
    if (voice != null && kDebugMode) {
      if (kDebugMode) {
        print(voice);
      }
    }
  }

  // Inicializa las configuraciones para TTS
  void initTts() {
    _setAwaitOptions();

    if (state.isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    state.tts.setStartHandler(() {
      if (kDebugMode) print("Playing");
    });

    state.tts.setCompletionHandler(() {
      if (kDebugMode) print("Complete");
    });

    state.tts.setCancelHandler(() {
      if (kDebugMode) print("Cancel");
    });

    state.tts.setPauseHandler(() {
      if (kDebugMode) print("Paused");
    });

    state.tts.setContinueHandler(() {
      if (kDebugMode) print("Continued");
    });

    state.tts.setErrorHandler((msg) {
      if (kDebugMode) print("error: $msg");
    });
  }

  // Cambia el número de operaciones y emite un nuevo estado
  void setOperations(int maxOperations) {
    emit(state.copyWith(maxOperations: maxOperations));
  }

  void setMaxDigits(int i) {
    emit(state.copyWith(maxDigits: i, minDigits: i!=1?i-1:i));
  }

  void setVoice(bool bool) {
    emit(state.copyWith(withVoice: bool));
  }

  void clear() {
    state.tts.stop();
    emit(state.copyWith(
      currentPage: 0,
      score: 0,
      operations: [],
    ));
  }

  void setOperationMode(OperationMode operationMode) {
    emit(state.copyWith(operationMode: operationMode));
  }

  void setHide(bool bool) {
    emit(state.copyWith(hide: bool));
  }

  void setCurrentPage(int index) {
    emit(state.copyWith(currentPage: index));
  }

  void setTime(Duration elapsed) {
    emit(state.copyWith(timeInMilliseconds: elapsed.inMilliseconds));
  }

  void captureTimeScoreAndOperations() {

    final display = state.operations[state.currentPage];
    final currentScore = state.score;
    final operation = display.state.operation;
    final currentTime = state.timeInMilliseconds;

    final  Map<String, Map<int, int>> newTime = Map<String, Map<int, int>>.from(state.time);
    newTime[operation] = {currentScore: currentTime};
    emit(state.copyWith(
      time: newTime,
    ));
  }

  void setMinDigits(int i) {
    emit(state.copyWith(minDigits: i));
  }
}
