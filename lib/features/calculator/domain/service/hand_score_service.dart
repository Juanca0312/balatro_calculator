import 'package:balatro_calculator/core/entities/deck_card.dart';
import 'package:balatro_calculator/core/enums/hand_type.dart';
import 'package:balatro_calculator/core/utils/constants.dart';
import 'package:balatro_calculator/features/calculator/domain/entities/hand_score_result.dart';
import 'package:balatro_calculator/features/calculator/domain/service/hand_evaluator_service.dart';

class HandScoreService {
  const HandScoreService(this._evaluator);
  final HandEvaluatorService _evaluator;

  /// Devuelve un resultado con el tipo de mano, el score base, el gameScore de las cartas
  /// y el score total.
  HandScoreResult evaluateHandScore({
    required List<DeckCard> cards,
    required Map<HandType, int> activeLevels,
  }) {
    final evalResult = _evaluator.evaluateWithCards(cards);
    final handType = evalResult.handType;
    final matchedCards = evalResult.matchedCards;

    final level = activeLevels[handType] ?? 1;

    final handScore = handScores
        .firstWhere((hs) => hs.handType == handType)
        .getScoreForLevel(level);

    final int gameScoreSum = matchedCards.fold<int>(
      0,
      (sum, card) => sum + card.rank.gameScore,
    );

    final total = handScore + gameScoreSum;

    return HandScoreResult(
      handType: handType,
      level: level,
      baseScore: handScore,
      gameScore: gameScoreSum,
      totalScore: total,
      matchedCards: matchedCards,
    );
  }
}
