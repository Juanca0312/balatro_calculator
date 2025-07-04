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

    final size = MediaQuery.of(context).size;

    // Ajusta el ancho deseado por carta (puedes tunear este valor)
    const desiredCardWidth = 50.0;
    final crossAxisCount = (size.width / desiredCardWidth).floor().clamp(1, 20);

    // O bien fuerza el crossAxisCount si quieres un valor fijo por orientación
    // final crossAxisCount = orientation == Orientation.portrait ? 7 : 13;

    // Calcula el aspect ratio dinámico
    final spacing = 7 * (crossAxisCount + 1); // Espaciado total
    final cardWidth = (size.width - spacing) / crossAxisCount;
    final cardHeight = cardWidth / 0.7; // 0.7 es el aspect ratio original
    final childAspectRatio = cardWidth / cardHeight;

    return SizedBox(
      height: size.height * 0.5,
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
          childAspectRatio: childAspectRatio,
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
