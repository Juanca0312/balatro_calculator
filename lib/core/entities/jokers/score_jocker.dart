import 'package:balatro_calculator/core/entities/deck_card.dart';
import 'package:balatro_calculator/core/entities/jokers/joker.dart';
import 'package:balatro_calculator/core/enums/card_suit.dart';
import 'package:balatro_calculator/core/enums/hand_type.dart';
import 'package:balatro_calculator/features/calculator/domain/entities/hand_score_result.dart';

/// Specialized interface for jokers that add score
/// Interfaz especializada para jokers que otorgan puntaje adicional
abstract class ScoreJoker extends Joker {
  const ScoreJoker({
    required super.name,
    required super.description,
    required super.assetPath,
    required super.rarity,
    required super.cost,
    required super.type,
  });

  int apply({
    required HandScoreResult baseScore,
    required List<DeckCard> playedCards,
  });
}

/// Base reusable class for jokers that give a fixed chip bonus
class FixedChipJoker extends ScoreJoker {
  FixedChipJoker({
    required super.name,
    required super.description,
    required super.assetPath,
    required super.rarity,
    required super.cost,
    required super.type,
    required this.bonus,
  });

  final int bonus;

  @override
  int apply({
    required HandScoreResult baseScore,
    required List<DeckCard> playedCards,
  }) => bonus;
}

/// Base class for jokers that count cards by suit
class SuitBasedJoker extends ScoreJoker {
  SuitBasedJoker({
    required super.name,
    required super.description,
    required super.assetPath,
    required super.rarity,
    required super.cost,
    required super.type,
    required this.suit,
    required this.multiplier,
  });

  final CardSuit suit;
  final int multiplier;

  @override
  int apply({
    required HandScoreResult baseScore,
    required List<DeckCard> playedCards,
  }) {
    final count = playedCards.where((c) => c.suit == suit).length;
    return count * multiplier;
  }
}

/// Base class for jokers that trigger on hand type
class HandTypeJoker extends ScoreJoker {
  HandTypeJoker({
    required super.name,
    required super.description,
    required super.assetPath,
    required super.rarity,
    required super.cost,
    required super.type,
    required this.validTypes,
    required this.bonus,
  });

  final List<HandType> validTypes;
  final int bonus;

  @override
  int apply({
    required HandScoreResult baseScore,
    required List<DeckCard> playedCards,
  }) => validTypes.contains(baseScore.handType) ? bonus : 0;
}
