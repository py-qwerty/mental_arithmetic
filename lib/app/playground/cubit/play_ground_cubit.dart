


import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_arithmetic/app/home/view/home_page.dart';
import 'package:mental_arithmetic/app/playground/widgets/display/cubit/display_cubit.dart';
import '../widgets/display/cubit/display_state.dart';
import 'play_ground_state.dart';

class PlayGroundCubit extends Cubit<PlayGroundState> {
  PlayGroundCubit(super.state);


  void generateDisplays(){
    final operations = <DisplayCubit>[];
    final Random random = Random();
    for(int i = 0; i < state.maxOperations; i++){
     final newDisplay = DisplayCubit() ..generateOperation(
         numSum: random.nextInt(2)+2,
         maxDigits: state.maxDigits,
         minDigits: state.minDigits,
         typeOperation: state.operationMode
     );


     operations.add(newDisplay);
    }


    emit(state.copyWith(
      operations: operations
    ));
  }

  Future<void> checkOperation(String value, {required BuildContext context}) async{
    int currentScore = state.score;
    final currentPage = state.pageController.page!.round();
    final currentDisplay = state.operations[currentPage];
    final numerickeypadCubit = state.numerickeypadCubit;
    currentDisplay.checkResult(value);

    if (currentDisplay.state.mode != answerMode.none){

      if(currentDisplay.state.mode == answerMode.correct){
        currentScore++;
      }else{
        currentScore--;
      }
      emit(state.copyWith(
        score: currentScore,
      ));

      numerickeypadCubit.enable(false);
      await Future.delayed(const Duration(milliseconds: 500));
      state.pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
      );
      numerickeypadCubit.enable(true);
      state.numerickeypadCubit.onClear();

      if(currentPage == state.maxOperations-1){
        Navigator.pushNamed(context, HomePage.route);
      }
    }


  }
}
