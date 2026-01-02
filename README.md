# 🧮 FlexiCompute

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean-green?style=for-the-badge)](https://antonioleiva.com/clean-architecture-android/)
[![Tests](https://img.shields.io/badge/Tests-Passing-brightgreen?style=for-the-badge)](https://flutter.dev/docs/testing)

**FlexiCompute** — это современный калькулятор на Flutter, переписанный с акцентом на чистую архитектуру (Clean Architecture) и масштабируемость. Проект демонстрирует переход от простого процедурного кода к уровню **Middle-разработки**.

---

## 🚀 Что было сделано (Refactoring Journey)

В ходе трансформации проекта из базового калькулятора в **FlexiCompute** были реализованы следующие улучшения:

* **Архитектурный сдвиг**: Полный переход от `setState` в одном файле к **Layered Architecture** (Presentation, Domain, Data).
* **Управление состоянием**: Внедрен **Cubit (BLoC)** для четкого разделения логики и UI.
* **Математический движок**: Реализован парсинг сложных выражений с учетом приоритета операторов (PEMDAS).
* **Компонентный подход**: Созданы переиспользуемые и адаптивные виджеты (Custom Buttons, Display).
* **Тестирование**: Логика вычислений покрыта **Unit-тестами**.

---

## 🏗 Архитектура проекта

Проект организован по принципам Feature-Driven Clean Architecture:

```text
lib/
├── core/                # Константы, общие утилиты и темы
├── features/            # Каждая папка — отдельная фича
│   └── calculator/
│       ├── domain/      # Чистая бизнес-логика (CalculatorEngine)
│       ├── presentation/
│       │   ├── bloc/    # Логика состояния (Cubit)
│       │   ├── pages/   # Основные экраны
│       │   └── widgets/ # Атомарные элементы UI
└── main.dart            # Точка входа и DI


🛠 Технологический стек
Flutter SDK (UI Framework)

Flutter Bloc / Cubit (State Management)

Math Expressions (Parsing & Evaluation)

Dart Test (Testing Framework)

Material 3 (Modern UI Design)