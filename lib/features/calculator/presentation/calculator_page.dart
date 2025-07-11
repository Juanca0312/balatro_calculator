import 'package:balatro_calculator/features/calculator/presentation/cubits/calculator/calculator_cubit.dart';
import 'package:balatro_calculator/features/calculator/presentation/cubits/deck/deck_cubit.dart';
import 'package:balatro_calculator/features/calculator/presentation/cubits/hand/hand_cubit.dart';
import 'package:balatro_calculator/features/calculator/presentation/cubits/jokers/jokers_cubit.dart';
import 'package:balatro_calculator/features/calculator/presentation/sections/deck_section.dart';
import 'package:balatro_calculator/features/calculator/presentation/sections/hands_section.dart';
import 'package:balatro_calculator/features/calculator/presentation/sections/jokers_section.dart';
import 'package:balatro_calculator/features/calculator/presentation/widgets/green_container.dart';
import 'package:balatro_calculator/features/calculator/presentation/widgets/hand_result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text('Balatro Game', style: textTheme.headlineSmall),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: GreenContainer(text: 'Desafio', onTap: () {}),
                      ),
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
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: GreenContainer(
                          text: _getJokersTitle(context),
                          onTap: () async => _showJokersModal(context),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GreenContainer(
                          text: 'Consumibles',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const DeckSection(),
                const SizedBox(height: 20),
                Center(
                  child: GreenContainer(
                    text: 'Jugada',
                    onTap: () async => _validateHand(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _validateHand(BuildContext context) async {
    final cards = context.read<DeckCubit>().state.selectedCards.toList();
    final activeLevels = context.read<HandCubit>().state.activeLevels;
    final result = context.read<CalculatorCubit>().checkDeck(
      cards,
      activeLevels,
    );

    showDialog(
      context: context,
      builder: (_) => HandResultDialog(scoreResult: result),
    );
  }

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

  Future<void> _showJokersModal(BuildContext context) async {
    final jokersCubit = context.read<JokersCubit>();
    await showModalBottomSheet(
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
                value: jokersCubit,
                child: const JokersSection(),
              ),
            ),
          ),
    );

    jokersCubit.resetFilter();
  }

  String _getJokersTitle(BuildContext context) {
    final selectedJokersCount =
        context.watch<JokersCubit>().state.selectedJokers.length;
    return 'Jokers\n$selectedJokersCount / 5';
  }
}
