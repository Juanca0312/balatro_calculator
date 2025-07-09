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

final List<ScoreJoker> jokers = [
  FixedChipJoker(
    name: 'Joker básico',
    assetPath: 'assets/jokers/basic.webp',
    rarity: 'Común',
    cost: 200,
    type: 'fichas+',
    bonus: 30,
  ),
  SuitBasedJoker(
    name: 'Joker codicioso',
    assetPath: 'assets/jokers/codicioso.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    suit: CardSuit.diamonds,
    multiplier: 20,
  ),
  SuitBasedJoker(
    name: 'Joker lujurioso',
    assetPath: 'assets/jokers/lujurioso.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    suit: CardSuit.hearts,
    multiplier: 20,
  ),
  SuitBasedJoker(
    name: 'Joker iracundo',
    assetPath: 'assets/jokers/iracundo.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    suit: CardSuit.spades,
    multiplier: 20,
  ),
  SuitBasedJoker(
    name: 'Joker glotón',
    assetPath: 'assets/jokers/gloton.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    suit: CardSuit.clubs,
    multiplier: 20,
  ),
  HandTypeJoker(
    name: 'Joker feliz',
    assetPath: 'assets/jokers/feliz.webp',
    rarity: 'Común',
    cost: 300,
    type: 'fichas+',
    validTypes: [
      HandType.pair,
      HandType.twoPair,
      HandType.threeOfAKind,
      HandType.fullHouse,
      HandType.fourOfAKind,
    ],
    bonus: 50,
  ),
  HandTypeJoker(
    name: 'Joker amistoso',
    assetPath: 'assets/jokers/amistoso.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    validTypes: [HandType.twoPair, HandType.fullHouse, HandType.fourOfAKind],
    bonus: 70,
  ),
  HandTypeJoker(
    name: 'Joker estrafalario',
    assetPath: 'assets/jokers/estrafalario.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    validTypes: [
      HandType.threeOfAKind,
      HandType.fullHouse,
      HandType.fourOfAKind,
    ],
    bonus: 80,
  ),
  HandTypeJoker(
    name: 'Joker extravagante',
    assetPath: 'assets/jokers/extravagante.webp',
    rarity: 'Común',
    cost: 500,
    type: 'fichas+',
    validTypes: [
      HandType.straight,
      HandType.straightFlush,
      HandType.royalFlush,
    ],
    bonus: 120,
  ),
  HandTypeJoker(
    name: 'Joker gracioso',
    assetPath: 'assets/jokers/gracioso.webp',
    rarity: 'Común',
    cost: 400,
    type: 'fichas+',
    validTypes: [HandType.flush, HandType.straightFlush],
    bonus: 90,
  ),
];
