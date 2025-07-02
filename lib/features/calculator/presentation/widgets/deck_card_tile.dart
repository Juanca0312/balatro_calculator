import 'package:balatro_calculator/core/entities/deck_card.dart';
import 'package:flutter/material.dart';

class DeckCardTile extends StatelessWidget {
  const DeckCardTile({
    super.key,
    required this.card,
    required this.isSelected,
    required this.onTap,
  });

  final DeckCard card;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: card.isEnabled ? onTap : null,
    child: Opacity(
      opacity: card.isEnabled ? 1.0 : 0.3,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Image.asset(card.assetPath),
        ),
      ),
    ),
  );
}
