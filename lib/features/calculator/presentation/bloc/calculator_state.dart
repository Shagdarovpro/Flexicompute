class CalculatorState {
  final String equation; // То, что вводит пользователь
  final String result;   // Результат вычисления

  CalculatorState({
    this.equation = "0",
    this.result = "0",
  });

  // Метод для удобного обновления состояния
  CalculatorState copyWith({String? equation, String? result}) {
    return CalculatorState(
      equation: equation ?? this.equation,
      result: result ?? this.result,
    );
  }
}