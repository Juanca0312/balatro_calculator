import 'package:balatro_calculator/core/entities/deck_card.dart';
import 'package:balatro_calculator/core/enums/card_rank.dart';
import 'package:balatro_calculator/core/enums/card_suit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'deck_state.dart';

class DeckCubit extends Cubit<DeckState> {
  DeckCubit() : super(DeckState(deck: _initialDeck()));

  static List<DeckCard> _initialDeck() => [
    for (var suit in CardSuit.values)
      for (var rank in CardRank.values) DeckCard.create(suit, rank),
  ];

  void toggleSelection(DeckCard card) {
    final selected = Set<DeckCard>.from(state.selectedCards);
    final isSelected = selected.contains(card);

    if (!isSelected && selected.length >= 5) return;

    isSelected ? selected.remove(card) : selected.add(card);

    emit(state.copyWith(selectedCards: selected));
  }

  void disableCards() {
    final updatedDeck =
        state.deck.map((card) {
          if (state.selectedCards.contains(card)) {
            return DeckCard(
              suit: card.suit,
              rank: card.rank,
              assetPath: card.assetPath,
              isEnabled: false,
            );
          }
          return card;
        }).toList();

    emit(state.copyWith(deck: updatedDeck, selectedCards: {}));
  }
}
