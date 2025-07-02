import 'package:balatro_calculator/features/calculator/presentation/cubits/hand/hand_cubit.dart';
import 'package:balatro_calculator/features/calculator/presentation/sections/deck_section.dart';
import 'package:balatro_calculator/features/calculator/presentation/sections/hands_section.dart';
import 'package:balatro_calculator/features/calculator/presentation/widgets/green_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          const Text('Balatro Game'),
          SizedBox(
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: GreenContainer(text: 'Desafio', onTap: () {})),
                const SizedBox(width: 10),
                Expanded(
                  child: GreenContainer(
                    text: 'Nivel jugadas',
                    onTap: () async => _showHandsBottomSheet(context),
                  ),
                ),
              ],
            ),
          ),
          const Row(children: [Text('Jokers'), Text('Consumibles')]),
          const DeckSection(),
          const Text('Calcular fichas de jugada'),
        ],
      ),
    ),
  );

  Future<void> _showHandsBottomSheet(BuildContext context) async {
    final handCubit = context.read<HandCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (bottomSheetContext) => FractionallySizedBox(
            heightFactor: 0.9,
            widthFactor: 1,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: BlocProvider.value(
                value: handCubit,
                child: const HandsSection(),
              ),
            ),
          ),
    );
  }
}
