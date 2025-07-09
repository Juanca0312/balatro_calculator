import 'package:balatro_calculator/features/calculator/domain/service/hand_evaluator_service.dart';
import 'package:balatro_calculator/features/calculator/domain/service/hand_score_service.dart';
import 'package:balatro_calculator/features/calculator/presentation/calculator_page.dart';
import 'package:balatro_calculator/features/calculator/presentation/cubits/calculator/calculator_cubit.dart';
import 'package:balatro_calculator/features/calculator/presentation/cubits/deck/deck_cubit.dart';
import 'package:balatro_calculator/features/calculator/presentation/cubits/hand/hand_cubit.dart';
import 'package:balatro_calculator/features/calculator/presentation/cubits/jokers/jokers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3CB06F)),
      fontFamily: 'Press Start 2P',
    ),
    home: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DeckCubit()),
        BlocProvider(create: (context) => HandCubit()),
        BlocProvider(create: (context) => JokersCubit()),
        BlocProvider(
          create:
              (context) => CalculatorCubit(
                handScoreService: HandScoreService(HandEvaluatorService()),
              ),
        ),
      ],
      child: const CalculatorPage(),
    ),
  );
}
