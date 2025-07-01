import 'package:balatro_calculator/core/entities/deck_card.dart';
import 'package:balatro_calculator/core/enums/card_rank.dart';
import 'package:balatro_calculator/core/enums/card_suit.dart';
import 'package:balatro_calculator/features/calculator/presentation/widgets/deck_card_tile.dart';
import 'package:flutter/material.dart';

class DeckSection extends StatefulWidget {
  const DeckSection({super.key});

  @override
  State<DeckSection> createState() => _DeckSectionState();
}

class _DeckSectionState extends State<DeckSection> {
  late List<DeckCard> deck;
  final List<DeckCard> selectedCards = [];

  @override
  void initState() {
    deck = _generateDeck();
    super.initState();
  }

  List<DeckCard> _generateDeck() {
    return [
      for (var suit in CardSuit.values)
        for (var rank in CardRank.values) DeckCard.create(suit, rank),
    ];
  }

  void _toggleSelection(DeckCard card) {
    setState(() {
      if (selectedCards.contains(card)) {
        selectedCards.remove(card);
      } else {
        selectedCards.add(card);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
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
            isSelected: selectedCards.contains(card),
            onTap: () => _toggleSelection(card),
          );
        },
      ),
    );
  }
}
