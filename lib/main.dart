import 'package:balatro_calculator/features/calculator/presentation/calculator_page.dart';
import 'package:balatro_calculator/features/calculator/presentation/cubits/deck/deck_cubit.dart';
import 'package:balatro_calculator/features/calculator/presentation/cubits/hand/hand_cubit.dart';
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
    home: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DeckCubit()),
        BlocProvider(create: (context) => HandCubit()),
      ],
      child: const CalculatorPage(),
    ),
  );
}
