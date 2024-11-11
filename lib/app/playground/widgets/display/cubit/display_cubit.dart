import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibration/vibration.dart';
import '../../../cubit/play_ground_state.dart';
import 'display_state.dart';

class DisplayCubit extends Cubit<DisplayState> {
  DisplayCubit()
      : super(
    const DisplayState(),
  );

  void generateOperation({
    required int numSum,
    required int maxDigits,
    required int minDigits,
    required OperationMode typeOperation,
  }) {
    final random = Random();
    List<int> numbers = [];
    for (int i = 0; i < numSum; i++) {
      final num = random.nextInt(maxDigits);
      if (num.toString().length >= minDigits && num.toString().length <= maxDigits) {
        numbers.add(num);
      } else {
        i--;
      }
    }

    if (typeOperation == OperationMode.addition) {
      final operation = numbers.join(' + ');
      final result = numbers.reduce((value, element) => value + element);
      emit(state.copyWith(
        operation: operation,
        result: result.toString(),
        label: 'Realiza esta operación',
      ));
    } else if (typeOperation == OperationMode.subtraction) {
      final operation = numbers.join(' - ');
      final result = numbers.reduce((value, element) => value - element);
      emit(state.copyWith(
        operation: operation,
        result: result.toString(),
        label: 'Realiza esta operación',
      ));
    } else if (typeOperation == OperationMode.multiplication) {
      int maxLimit = 1000; // Limita el producto a 1000
      int maxDigits = 2; // Número máximo de dígitos por número
      List<int> numbers;
      int result;

      // Bucle para generar números hasta que el producto sea menor o igual a 1000
      do {
        numbers = List.generate(numSum, (_) {
          int upperLimit = pow(10, maxDigits).toInt(); // Define el límite superior basado en maxDigits
          return Random().nextInt(upperLimit - 1) + 1; // Genera un número de hasta maxDigits dígitos
        });
        result = numbers.reduce((value, element) => value * element);
      } while (result > maxLimit);

      final operation = numbers.join(' * ');
      emit(state.copyWith(
        operation: operation,
        result: result.toString(),
        label: 'Realiza esta operación',
      ));
    }
    else if (typeOperation == OperationMode.division) {
      int result = Random().nextInt(100);
      int denominator = numbers[0];
      int numerator = result * denominator;
      // Realiza la operación y genera el resultado y el texto
      final operation = '$numerator / $denominator';
      emit(state.copyWith(
        operation: operation,
        result: result.toString(),
        label: 'Realiza esta operación',
      ));
    } else if (typeOperation == OperationMode.percentage) {

      List<String> percents = ['5', '10', '15', '20', '25', '30', '35', '40', '45', '50', '60', '70', '75', '80', '90', '100'];

      final result = Random().nextInt(1000);
      String percent;
      int number;
      do {
        percent = percents[Random().nextInt(percents.length)];
        number = (result * 100) ~/ int.parse(percent);
      } while ((result * 100) % int.parse(percent) != 0);

      final operation = '$percent% de $number';
      emit(state.copyWith(
        operation: operation,
        result: result.toString(),
        label: 'Calcula el porcentaje',
      ));
    } else if (typeOperation == OperationMode.mixed) {
      final operators = ['+', '-', '*', '/'];
      String operation = '';
      int result = numbers[0];

      for (int i = 1; i < numbers.length; i++) {
        final operator = operators[random.nextInt(4)];
        final num = numbers[i];

        // Probabilidad de agregar paréntesis alrededor de esta operación
        if (random.nextBool() && i < numbers.length - 1) {
          final innerOperation = '($result $operator $num)';
          switch (operator) {
            case '+':
              result += num;
              break;
            case '-':
              result -= num;
              break;
            case '*':
              result *= num;
              break;
            case '/':
              result ~/= num != 0 ? num : 1; // evita la división por cero
              break;
          }
          operation = operation.isEmpty ? innerOperation : '($operation $operator $innerOperation)';
        } else {
          operation = operation.isEmpty ? '$result $operator $num' : '$operation $operator $num';
          switch (operator) {
            case '+':
              result += num;
              break;
            case '-':
              result -= num;
              break;
            case '*':
              result *= num;
              break;
            case '/':
              result ~/= num != 0 ? num : 1;
              break;
          }
        }
      }

      emit(state.copyWith(
        operation: operation,
        result: result.toString(),
        label: 'Realiza esta operación',
      ));
    }
  }

  Future<void> checkResult(String value) async{
    emit(state.copyWith(
      value: value,
    ));
    if (value == state.result) {
      emit(state.copyWith(
        mode: answerMode.correct,
      ));


    } else if (value.length == state.result.length) {
      emit(state.copyWith(
        mode: answerMode.wrong,
      ));

    } else {
      emit(state.copyWith(
        mode: answerMode.none,
      ));
    }
  }
}
