import 'package:balatro_calculator/core/entities/deck_card.dart';
import 'package:flutter/material.dart';

class DeckCardTile extends StatelessWidget {
  final DeckCard card;
  final bool isSelected;
  final VoidCallback onTap;

  const DeckCardTile({
    super.key,
    required this.card,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: card.isEnabled ? onTap : null,
      child: Opacity(
        opacity: card.isEnabled ? 1.0 : 0.3,
        child: Container(
          decoration: BoxDecoration(
            border:
                isSelected ? Border.all(color: Colors.blue, width: 3) : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(card.assetPath),
        ),
      ),
    );
  }
}
