import 'package:flutter_bloc/flutter_bloc.dart';
import 'calculator_state.dart';
import '../../domain/calculator_engine.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  final CalculatorEngine _engine;

  CalculatorCubit(this._engine) : super(CalculatorState());

  // Когда пользователь нажимает на цифру или знак
  void onButtonPressed(String text) {
    String newEquation = state.equation;

    if (text == "AC") {
      emit(CalculatorState()); // Сброс
      return;
    }

    if (text == "=") {
      _calculateResult();
      return;
    }

    // Обработка ввода
    if (newEquation == "0") {
      newEquation = text;
    } else {
      newEquation += text;
    }

    emit(state.copyWith(equation: newEquation));
  }

  void _calculateResult() {
    try {
      final res = _engine.calculate(state.equation);
      // Форматируем результат: если целое число — убираем .0
      String formattedResult = res % 1 == 0 ? res.toInt().toString() : res.toString();
      emit(state.copyWith(result: formattedResult));
    } catch (e) {
      emit(state.copyWith(result: "Error"));
    }
  }
}