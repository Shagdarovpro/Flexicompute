import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calculator_cubit.dart';
import '../bloc/calculator_state.dart';
import '../widgets/calc_button.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Стильный черный фон
      body: SafeArea(
        child: Column(
          children: [
            // 1. Область вывода (Дисплей)
            Expanded(
              flex: 2,
              child: _buildDisplay(),
            ),

            // 2. Сетка кнопок
            Expanded(
              flex: 3,
              child: _buildButtonsGrid(context),
            ),
          ],
        ),
      ),
    );
  }

  /// Виджет дисплея, который слушает изменения в Cubit
  Widget _buildDisplay() {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Верхняя строка: текущее выражение
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  state.equation,
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Нижняя строка: результат
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  state.result,
                  style: const TextStyle(
                    fontSize: 70,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Сетка кнопок калькулятора
  Widget _buildButtonsGrid(BuildContext context) {
    // Список символов для кнопок в порядке их отображения
    final List<String> buttons = [
      'AC',
      '(',
      ')',
      '÷',
      '7',
      '8',
      '9',
      '×',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      'C',
      '0',
      '.',
      '=',
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      physics:
          const NeverScrollableScrollPhysics(), // Сетка не должна скроллиться отдельно
      itemCount: buttons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 4 колонки
        mainAxisSpacing: 12, // Отступы между строками
        crossAxisSpacing: 12, // Отступы между колонками
        childAspectRatio: 1, // Квадратные ячейки
      ),
      itemBuilder: (context, index) {
        final text = buttons[index];

        // Логика стилизации Middle-уровня: вычисляем цвета на лету
        Color? bgColor;
        Color txtColor = Colors.white;

        if (text == 'AC' || text == 'C') {
          bgColor = Colors.grey[400];
          txtColor = Colors.black;
        } else if ('÷×-+='.contains(text)) {
          bgColor = Colors.orange[800];
        } else {
          bgColor = Colors.grey[900];
        }

        return CalcButton(
          text: text,
          backgroundColor: bgColor,
          textColor: txtColor,
          onPressed: () {
            // Обращение к Cubit через контекст (read)
            context.read<CalculatorCubit>().onButtonPressed(text);
          },
        );
      },
    );
  }
}
