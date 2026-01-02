import 'package:flutter_test/flutter_test.dart';
import 'package:flexicompute/features/calculator/domain/calculator_engine.dart';

void main() {
  late CalculatorEngine engine;

  // Инициализация перед каждым тестом
  setUp(() {
    engine = CalculatorEngine();
  });

  group('CalculatorEngine Tests', () {
    test('Basic arithmetic (addition, subtraction, multiplication, division)', () {
      expect(engine.calculate("10+5"), 15.0);
      expect(engine.calculate("10-5"), 5.0);
      expect(engine.calculate("10*5"), 50.0);
      expect(engine.calculate("10/2"), 5.0);
    });

    test('Operator precedence (PEMDAS)', () {
      // Умножение должно быть первым: 2 + (2 * 5) = 12
      expect(engine.calculate("2+2*5"), 12.0);
    });

    test('Parentheses support', () {
      // Скобки меняют приоритет: (2 + 2) * 5 = 20
      expect(engine.calculate("(2+2)*5"), 20.0);
    });

    test('Decimal numbers support', () {
      expect(engine.calculate("10.5+0.5"), 11.0);
    });

    test('Handling division by zero', () {
      // В Dart/math_expressions деление на 0 возвращает Infinity
      expect(engine.calculate("10/0"), double.infinity);
    });

    test('Should throw exception on invalid characters', () {
      // Проверяем, что ввод букв вызывает ошибку
      expect(() => engine.calculate("abc"), throwsException);
    });

    test('Should throw exception on mismatched parentheses', () {
      // Некорректные скобки должны ломать парсер
      expect(() => engine.calculate("(2+2"), throwsException);
    });
  });
}