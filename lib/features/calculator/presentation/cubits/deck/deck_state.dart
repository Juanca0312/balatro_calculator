part of 'deck_cubit.dart';

class DeckState extends Equatable {
  const DeckState({this.deck = const [], this.selectedCards = const {}});

  final List<DeckCard> deck;
  final Set<DeckCard> selectedCards;

  DeckState copyWith({List<DeckCard>? deck, Set<DeckCard>? selectedCards}) =>
      DeckState(
        deck: deck ?? this.deck,
        selectedCards: selectedCards ?? this.selectedCards,
      );

  @override
  List<Object> get props => [deck, selectedCards];
}
