import 'package:balatro_calculator/core/enums/card_rank.dart';
import 'package:balatro_calculator/core/enums/card_suit.dart';

class DeckCard {
  DeckCard({
    required this.suit,
    required this.rank,
    required this.assetPath,
    this.isEnabled = true,
  });

  factory DeckCard.create(CardSuit suit, CardRank rank) {
    final path = 'assets/cards/${rank.symbol}_${suit.name}.png';
    return DeckCard(suit: suit, rank: rank, assetPath: path);
  }

  final CardSuit suit;
  final CardRank rank;
  final String assetPath;
  bool isEnabled;

  @override
  String toString() =>
      'DeckCard(rank: ${rank.symbol}, suit: ${suit.name}, enabled: $isEnabled)';
}
