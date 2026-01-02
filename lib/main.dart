import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flexicompute/features/calculator/domain/calculator_engine.dart';
import 'package:flexicompute/features/calculator/presentation/bloc/calculator_cubit.dart';
import 'package:flexicompute/features/calculator/presentation/pages/calculator_page.dart';

void main() {
  // Фиксируем ориентацию экрана (профессиональный подход для калькуляторов)
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const FlexiComputeApp());
}

class FlexiComputeApp extends StatelessWidget {
  const FlexiComputeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexiCompute',
      debugShowCheckedModeBanner: false, // Убираем баннер "Debug"
      
      // Настройка темной темы в стиле Middle-проектов
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
          surface: Colors.black,
        ),
      ),
      
      // Главная точка входа с прокидыванием логики (DI)
      home: BlocProvider(
        create: (context) => CalculatorCubit(CalculatorEngine()),
        child: const CalculatorPage(),
      ),
    );
  }
}