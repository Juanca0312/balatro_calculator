import 'package:balatro_calculator/core/entities/deck_card.dart';
import 'package:balatro_calculator/core/entities/jokers/joker.dart';
import 'package:balatro_calculator/core/enums/hand_type.dart';

/// Representa el resultado del cálculo de puntuación de una mano en el juego.
class HandScoreResult {
  HandScoreResult({
    required this.handType,
    required this.handLevel,
    required this.handBaseScore,
    required this.matchedCardScore,
    required this.jokerBonuses,
    required this.totalScore,
    required this.matchedCards,
  });

  /// Tipo de mano evaluada (ej. pair, flush, straight, etc.)
  final HandType handType;

  /// Nivel de mejora aplicado a la mano, según los upgrades activos.
  final int handLevel;

  /// Puntos base otorgados por el tipo de mano y su nivel.
  final int handBaseScore;

  /// Suma de los gameScores de las cartas que hicieron match en la mano.
  final int matchedCardScore;

  /// Mapa de jokers aplicados a su bonificación respectiva en puntos.
  /// Solo incluye jokers del tipo [ScoreJoker].
  final Map<Joker, int> jokerBonuses;

  /// Suma de `matchedCardScore` + bonificaciones de jokers.
  int get gameScore =>
      matchedCardScore + jokerBonuses.values.fold(0, (a, b) => a + b);

  /// Puntuación total: `baseScore` + `gameScore`.
  final int totalScore;

  /// Lista de cartas que contribuyeron directamente a formar la mano.
  final List<DeckCard> matchedCards;

  @override
  String toString() {
    final matched = matchedCards
        .map((c) => '${c.rank.symbol}${c.suit.name}')
        .join(', ');
    final bonuses = jokerBonuses.entries
        .map((e) => '${e.key.name}: ${e.value}')
        .join(', ');
    return 'HandScoreResult('
        'handType: $handType, '
        'handLevel: $handLevel, '
        'handBaseScore: $handBaseScore, '
        'matchedCardScore: $matchedCardScore, '
        'gameScore: $gameScore, '
        'jokerBonuses: {$bonuses}, '
        'totalScore: $totalScore, '
        'matchedCards: [$matched]'
        ')';
  }
}
