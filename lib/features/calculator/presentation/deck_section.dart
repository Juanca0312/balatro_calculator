import 'package:balatro_calculator/features/calculator/presentation/cubits/deck/deck_cubit.dart';
import 'package:balatro_calculator/features/calculator/presentation/widgets/deck_card_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeckSection extends StatelessWidget {
  const DeckSection({super.key});

  @override
  Widget build(BuildContext context) {
    final deck = context.select((DeckCubit cubit) => cubit.state.deck);
    final selected = context.select(
      (DeckCubit cubit) => cubit.state.selectedCards,
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemCount: deck.length,
        itemBuilder: (context, index) {
          final card = deck[index];
          return DeckCardTile(
            card: card,
            isSelected: selected.contains(card),
            onTap: () => context.read<DeckCubit>().toggleSelection(card),
          );
        },
      ),
    );
  }
}
