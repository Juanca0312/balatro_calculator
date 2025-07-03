import 'package:balatro_calculator/core/entities/deck_card.dart';
import 'package:balatro_calculator/core/enums/hand_type.dart';
import 'package:balatro_calculator/features/calculator/domain/service/hand_score_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit({required HandScoreService handScoreService})
    : _handScoreService = handScoreService,
      super(const CalculatorState());

  final HandScoreService _handScoreService;

  void checkDeck(List<DeckCard> cards, Map<HandType, int> activeLevels) {
    if (cards.isEmpty) {
      // TODO: toast empty cards or disable button
      return;
    }

    final scoreResult = _handScoreService.evaluateHandScore(
      activeLevels: activeLevels,
      cards: cards,
    );
    print(scoreResult);
    // TODO: show in modal
  }
}
