import 'package:math_expressions/math_expressions.dart';

class CalculatorEngine {
  /// Основная функция расчета. 
  /// Принимает строку (например "2+2*5"), возвращает результат.
  double calculate(String expression) {
    try {
      // 1. Очищаем строку от лишних символов (безопасность)
      String finalExpression = expression.replaceAll('x', '*').replaceAll('÷', '/');
      
      // 2. Парсим выражение
      Parser p = Parser();
      Expression exp = p.parse(finalExpression);
      
      // 3. Вычисляем результат в вещественных числах
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      
      return eval;
    } catch (e) {
      throw Exception("Ошибка в выражении");
    }
  }
}