import 'package:balatro_calculator/core/entities/deck_card.dart';
import 'package:balatro_calculator/core/entities/jokers/joker.dart';
import 'package:balatro_calculator/core/entities/jokers/score_jocker.dart';
import 'package:balatro_calculator/core/enums/hand_type.dart';
import 'package:balatro_calculator/core/utils/constants.dart';
import 'package:balatro_calculator/features/calculator/domain/entities/hand_score_result.dart';
import 'package:balatro_calculator/features/calculator/domain/service/hand_evaluator_service.dart';

class HandScoreService {
  const HandScoreService(this._evaluator);

  final HandEvaluatorService _evaluator;

  HandScoreResult evaluateHandScore({
    required List<DeckCard> cards,
    required Map<HandType, int> activeLevels,
    List<Joker> jokers = const [],
  }) {
    final evalResult = _evaluator.evaluateWithCards(cards);
    final handType = evalResult.handType;
    final matchedCards = evalResult.matchedCards;

    final level = activeLevels[handType] ?? 1;

    final baseScore = handScores
        .firstWhere((hs) => hs.handType == handType)
        .getScoreForLevel(level);

    final matchedCardScore = matchedCards.fold<int>(
      0,
      (sum, card) => sum + card.rank.gameScore,
    );

    final appliedBonuses = <Joker, int>{};

    for (final joker in jokers) {
      if (joker is ScoreJoker) {
        final bonus = joker.apply(
          baseScore: HandScoreResult(
            handType: handType,
            handLevel: level,
            handBaseScore: baseScore,
            matchedCardScore: matchedCardScore,
            jokerBonuses: const {},
            totalScore: 0,
            matchedCards: matchedCards,
          ),
          playedCards: cards,
        );
        appliedBonuses[joker] = bonus;
      }
    }

    final totalJokerBonus = appliedBonuses.values.fold(0, (a, b) => a + b);
    final gameScore = matchedCardScore + totalJokerBonus;
    final totalScore = baseScore + gameScore;

    return HandScoreResult(
      handType: handType,
      handLevel: level,
      handBaseScore: baseScore,
      matchedCardScore: matchedCardScore,
      jokerBonuses: appliedBonuses,
      totalScore: totalScore,
      matchedCards: matchedCards,
    );
  }
}
