import 'package:balatro_calculator/core/entities/deck_card.dart';
import 'package:balatro_calculator/core/enums/card_rank.dart';
import 'package:balatro_calculator/core/enums/card_suit.dart';
import 'package:balatro_calculator/core/enums/hand_type.dart';
import 'package:balatro_calculator/features/calculator/domain/entities/hand_evaluation.dart';

class HandEvaluatorService {
  HandEvaluation evaluateWithCards(List<DeckCard> cards) {
    final handType = evaluate(cards);
    final matched = _extractMatchedCards(cards, handType);
    return HandEvaluation(handType: handType, matchedCards: matched);
  }

  HandType evaluate(List<DeckCard> cards) {
    final rankGroups = _groupByRank(cards);
    final suitGroups = _groupBySuit(cards);

    for (var suit in suitGroups.keys) {
      final suitedCards = suitGroups[suit]!;
      if (suitedCards.length >= 5) {
        final suitedRanks = suitedCards.map((c) => c.rank).toList();
        if (_isStraight(suitedRanks)) {
          return _isRoyalStraight(suitedRanks)
              ? HandType.royalFlush
              : HandType.straightFlush;
        }
      }
    }

    if (rankGroups.values.any((g) => g.length == 4)) {
      return HandType.fourOfAKind;
    }

    if (_hasFullHouse(rankGroups)) {
      return HandType.fullHouse;
    }

    if (suitGroups.values.any((g) => g.length >= 5)) {
      return HandType.flush;
    }

    final ranks = cards.map((c) => c.rank).toList();
    if (_isStraight(ranks)) {
      return HandType.straight;
    }

    if (rankGroups.values.any((g) => g.length == 3)) {
      return HandType.threeOfAKind;
    }

    final pairCount = rankGroups.values.where((g) => g.length == 2).length;
    if (pairCount == 2) {
      return HandType.twoPair;
    }

    if (pairCount == 1) {
      return HandType.pair;
    }

    return HandType.highCard;
  }

  Map<CardRank, List<DeckCard>> _groupByRank(List<DeckCard> cards) {
    final map = <CardRank, List<DeckCard>>{};
    for (final card in cards) {
      map.putIfAbsent(card.rank, () => []).add(card);
    }
    return map;
  }

  Map<CardSuit, List<DeckCard>> _groupBySuit(List<DeckCard> cards) {
    final map = <CardSuit, List<DeckCard>>{};
    for (final card in cards) {
      map.putIfAbsent(card.suit, () => []).add(card);
    }
    return map;
  }

  bool _isStraight(List<CardRank> ranks) {
    if (ranks.length < 2) return false;

    final values = ranks.map((r) => r.value).toSet().toList()..sort();

    // As en 1 o 14
    if (values.contains(CardRank.A.value)) {
      values.add(1);
      values.sort();
    }

    // Buscar secuencia consecutiva de al menos 5
    for (var i = 0; i <= values.length - 5; i++) {
      if (_isConsecutive(values.sublist(i, i + 5))) return true;
    }

    return false;
  }

  bool _isConsecutive(List<int> values) {
    for (var i = 0; i < values.length - 1; i++) {
      if (values[i + 1] != values[i] + 1) return false;
    }
    return true;
  }

  bool _isRoyalStraight(List<CardRank> ranks) {
    final values = ranks.map((r) => r.value).toSet();
    return values.containsAll([10, 11, 12, 13, 14]);
  }

  bool _hasFullHouse(Map<CardRank, List<DeckCard>> rankGroups) {
    final hasThree = rankGroups.values.any((g) => g.length == 3);
    final hasPair = rankGroups.values.any((g) => g.length == 2);
    return hasThree && hasPair;
  }

  List<DeckCard> _extractMatchedCards(List<DeckCard> cards, HandType handType) {
    switch (handType) {
      case HandType.pair:
        return _cardsOfSameRank(cards, 2);
      case HandType.twoPair:
        return _cardsOfTwoPairs(cards);
      case HandType.threeOfAKind:
        return _cardsOfSameRank(cards, 3);
      case HandType.fourOfAKind:
        return _cardsOfSameRank(cards, 4);
      case HandType.fullHouse:
        return _cardsOfFullHouse(cards);
      case HandType.straight:
      case HandType.straightFlush:
      case HandType.royalFlush:
        return _cardsOfStraight(cards);
      case HandType.flush:
        return _cardsOfFlush(cards);
      default:
        return [cards.reduce((a, b) => a.rank.value >= b.rank.value ? a : b)];
    }
  }

  List<DeckCard> _cardsOfSameRank(List<DeckCard> cards, int count) {
    final map = <CardRank, List<DeckCard>>{};
    for (final card in cards) {
      map.putIfAbsent(card.rank, () => []).add(card);
    }
    final group = map.values.firstWhere(
      (g) => g.length == count,
      orElse: () => [],
    );
    return group;
  }

  List<DeckCard> _cardsOfTwoPairs(List<DeckCard> cards) {
    final map = <CardRank, List<DeckCard>>{};
    for (final card in cards) {
      map.putIfAbsent(card.rank, () => []).add(card);
    }
    final pairs =
        map.values.where((g) => g.length == 2).expand((g) => g).toList();
    return pairs;
  }

  List<DeckCard> _cardsOfFullHouse(List<DeckCard> cards) => [
    ..._cardsOfSameRank(cards, 3),
    ..._cardsOfSameRank(cards, 2),
  ];

  List<DeckCard> _cardsOfFlush(List<DeckCard> cards) {
    final map = <CardSuit, List<DeckCard>>{};
    for (final card in cards) {
      map.putIfAbsent(card.suit, () => []).add(card);
    }
    final group = map.values.firstWhere((g) => g.length >= 5, orElse: () => []);
    return group;
  }

  List<DeckCard> _cardsOfStraight(List<DeckCard> cards) => cards;
}
