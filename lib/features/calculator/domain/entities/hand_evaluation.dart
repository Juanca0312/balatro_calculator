import 'package:balatro_calculator/core/entities/deck_card.dart';
import 'package:balatro_calculator/core/enums/hand_type.dart';

class HandEvaluation {
  const HandEvaluation({required this.handType, required this.matchedCards});
  final HandType handType;
  final List<DeckCard> matchedCards;
}
