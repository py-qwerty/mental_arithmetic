import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/play_ground_state.dart';
import 'display_state.dart';

class DisplayCubit extends Cubit<DisplayState> {
  DisplayCubit() : super(const DisplayState());

  void generateOperation({
    required int numSum,
    required int maxDigits,
    required int minDigits,
    required OperationMode typeOperation,
  }) {
    if (maxDigits < minDigits || maxDigits <= 0 || minDigits <= 0) {
      throw Exception("Invalid digits range: maxDigits must be greater or equal than minDigits and both must be positive.");
    }

    switch (typeOperation) {
      case OperationMode.addition:
        _generateAddition(_generateNumbers(numSum, maxDigits, minDigits));
        break;
      case OperationMode.subtraction:
        _generateSubtraction(_generateNumbers(numSum, maxDigits, minDigits));
        break;
      case OperationMode.multiplication:
        _generateMultiplication(numSum, maxDigits);
        break;
      case OperationMode.division:
        _generateDivision(_generateNumbers(numSum, maxDigits, minDigits));
        break;
      case OperationMode.percentage:
        _generatePercentage();
        break;
      case OperationMode.multiplicationThenAddition:
        _generateMultiplicationThenAddition(maxDigits);
        break;
      case OperationMode.mixed:
        _generateRandomOperation(numSum, maxDigits, minDigits);
        break;
      case OperationMode.additionDivision:
        _generateAdditionDivision(maxDigits);
        break;
      case OperationMode.subtractionDivision:
        _generateSubtractionDivision(maxDigits);
        break;
      case OperationMode.multiplicationDivision:
        _generateMultiplicationDivision(maxDigits);
        break;
      case OperationMode.bigNumber:
        _generateMultiplicationDivision(maxDigits);
        break;
    }
  }

  List<int> _generateNumbers(int numSum, int maxDigits, int minDigits) {
    final random = Random();
    List<int> numbers = [];
    const maxAttempts = 1000;
    int attempts = 0;

    for (int i = 0; i < numSum; i++) {
      if (attempts > maxAttempts) {
        throw Exception("Failed to generate valid numbers within $maxAttempts attempts.");
      }
      final num = random.nextInt(pow(10, maxDigits).toInt());
      if (num.toString().length >= minDigits) {
        numbers.add(num);
      } else {
        i--;
      }
      attempts++;
    }
    return numbers;
  }

  void _generateAddition(List<int> numbers) {
    final operation = numbers.join(' + ');
    final result = numbers.reduce((value, element) => value + element);
    emit(state.copyWith(operation: operation, result: result.toString(), label: 'Realiza esta operación'));
  }

  void _generateSubtraction(List<int> numbers) {
    final operation = numbers.join(' - ');
    final result = numbers.reduce((value, element) => value - element);
    emit(state.copyWith(operation: operation, result: result.toString(), label: 'Realiza esta operación'));
  }

  void _generateMultiplication(int numSum, int maxDigits) {
    num maxLimit = pow(10, maxDigits + 1);
    List<int> numbers;
    int result;
    int maxAttempts = pow(10, 7).toInt();
    int attempts = 0;

    do {
      if (attempts > maxAttempts) {
        throw Exception("Failed to generate valid multiplication within $maxAttempts attempts.");
      }
      numbers = List.generate(numSum, (_) {
        int upperLimit = pow(10, maxDigits).toInt();
        return Random().nextInt(upperLimit - 1) + 1;
      });
      result = numbers.reduce((value, element) => value * element);
      attempts++;
    } while (result > maxLimit);

    final operation = numbers.join(' * ');
    emit(state.copyWith(operation: operation, result: result.toString(), label: 'Realiza esta operación'));
  }

  void _generateDivision(List<int> numbers) {
    int result = Random().nextInt(100);
    int denominator = numbers[0] == 0 ? 1 : numbers[0]; // Avoid division by zero
    int numerator = result * denominator;
    final operation = '$numerator / $denominator';
    emit(state.copyWith(operation: operation, result: result.toString(), label: 'Realiza esta operación'));
  }

  void _generatePercentage() {
    List<String> percents = ['5', '10', '15', '20', '25', '30', '35', '40', '45', '50', '60', '70', '75', '80', '90', '100'];
    final result = Random().nextInt(1000);
    String percent;
    int number;
    const maxAttempts = 1000;
    int attempts = 0;

    do {
      if (attempts > maxAttempts) {
        throw Exception("Failed to generate valid percentage within $maxAttempts attempts.");
      }
      percent = percents[Random().nextInt(percents.length)];
      number = (result * 100) ~/ int.parse(percent);
      attempts++;
    } while ((result * 100) % int.parse(percent) != 0);

    final operation = '$percent% de $number';
    emit(state.copyWith(operation: operation, result: result.toString(), label: 'Calcula el porcentaje'));
  }

  void _generateMultiplicationThenAddition(int maxDigits) {
    final random = Random();
    final a = random.nextInt(pow(10, maxDigits).toInt());
    final b = random.nextInt(pow(10, maxDigits).toInt());
    final c = random.nextInt(pow(10, maxDigits).toInt());
    final result = (a * b) + c;
    final operation = '($a * $b) + $c';
    emit(state.copyWith(operation: operation, result: result.toString(), label: 'Realiza esta operación'));
  }

  void _generateAdditionDivision(int maxDigits) {
    final random = Random();
    int a = random.nextInt(pow(10, maxDigits).toInt());
    int b = random.nextInt(pow(10, maxDigits).toInt());
    int c;
    int numerator;
    const maxAttempts = 1000;
    int attempts = 0;

    do {
      if (attempts > maxAttempts) {
        throw Exception("Failed to generate valid addition division within $maxAttempts attempts.");
      }
      c = random.nextInt(pow(10, maxDigits - 1).toInt()) + 1;
      numerator = a + b;
      attempts++;
    } while (numerator % c != 0);

    final result = numerator ~/ c;
    final operation = '($a + $b) / $c';
    emit(state.copyWith(operation: operation, result: result.toString(), label: 'Realiza esta operación'));
  }

  void _generateSubtractionDivision(int maxDigits) {
    final random = Random();
    int a = random.nextInt(pow(10, maxDigits).toInt());
    int b = random.nextInt(pow(10, maxDigits).toInt());
    int c;
    int numerator;
    const maxAttempts = 1000;
    int attempts = 0;

    do {
      if (attempts > maxAttempts) {
        throw Exception("Failed to generate valid subtraction division within $maxAttempts attempts.");
      }
      c = random.nextInt(pow(10, maxDigits - 1).toInt()) + 1;
      numerator = a - b;
      attempts++;
    } while (numerator % c != 0 || numerator < 0);

    final result = numerator ~/ c;
    final operation = '($a - $b) / $c';
    emit(state.copyWith(operation: operation, result: result.toString(), label: 'Realiza esta operación'));
  }

  void _generateMultiplicationDivision(int maxDigits) {
    final random = Random();
    int a = random.nextInt(pow(10, maxDigits).toInt());
    int b = random.nextInt(pow(10, maxDigits).toInt());
    int c;
    int numerator;
    const maxAttempts = 1000;
    int attempts = 0;

    do {
      if (attempts > maxAttempts) {
        throw Exception("Failed to generate valid multiplication division within $maxAttempts attempts.");
      }
      c = random.nextInt(pow(10, maxDigits - 1).toInt()) + 1;
      numerator = a * b;
      attempts++;
    } while (numerator % c != 0);

    final result = numerator ~/ c;
    final operation = '($a * $b) / $c';
    emit(state.copyWith(operation: operation, result: result.toString(), label: 'Realiza esta operación'));
  }

  void _generateRandomOperation(int numSum, int maxDigits, int minDigits) {
    final random = Random();
    final operations = [
          () => _generateAddition(_generateNumbers(numSum, maxDigits, minDigits)),
          () => _generateSubtraction(_generateNumbers(numSum, maxDigits, minDigits)),
          () => _generateMultiplication(numSum, maxDigits),
          () => _generateDivision(_generateNumbers(numSum, maxDigits, minDigits)),
          () => _generatePercentage(),
          () => _generateMultiplicationThenAddition(maxDigits),
          () => _generateAdditionDivision(maxDigits),
          //() => _generateSubtractionDivision(maxDigits),
          () => _generateMultiplicationDivision(maxDigits),
    ];

    final randomOperation = operations[random.nextInt(operations.length)];
    randomOperation();
  }

  int _getRandomDivisor(int number) {
    if (number == 0) return 1;
    List<int> divisors = [];
    for (int i = 1; i <= number.abs(); i++) {
      if (number % i == 0) divisors.add(i);
    }
    int divisor = divisors[Random().nextInt(divisors.length)];
    return Random().nextBool() ? -divisor : divisor;
  }

  Future<void> checkResult(String value) async {
    emit(state.copyWith(value: value));
    if (value == state.result) {
      emit(state.copyWith(mode: answerMode.correct));
    } else if (value.length == state.result.length) {
      emit(state.copyWith(mode: answerMode.wrong));
    } else {
      emit(state.copyWith(mode: answerMode.none));
    }
  }

  void setMode(answerMode mode) {
    emit(state.copyWith(mode: mode));
  }
}
