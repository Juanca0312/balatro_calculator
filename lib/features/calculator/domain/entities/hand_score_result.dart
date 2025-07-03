import 'package:balatro_calculator/core/entities/deck_card.dart';
import 'package:balatro_calculator/core/enums/hand_type.dart';

class HandScoreResult {
  HandScoreResult({
    required this.handType,
    required this.level,
    required this.baseScore,
    required this.gameScore,
    required this.totalScore,
    required this.matchedCards,
  });

  final HandType handType;
  final int level;
  final int baseScore;
  final int gameScore;
  final int totalScore;
  final List<DeckCard> matchedCards;

  @override
  String toString() {
    final matched = matchedCards
        .map((c) => '${c.rank.symbol}${c.suit.name}')
        .join(', ');
    return 'HandScoreResult('
        'handType: $handType, '
        'level: $level, '
        'baseScore: $baseScore, '
        'gameScore: $gameScore, '
        'totalScore: $totalScore, '
        'matchedCards: [$matched]'
        ')';
  }
}
