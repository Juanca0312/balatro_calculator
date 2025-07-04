import 'package:balatro_calculator/core/enums/hand_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'hand_state.dart';

class HandCubit extends Cubit<HandState> {
  HandCubit()
    : super(
        HandState(
          activeLevels: {for (var hand in HandType.values) hand: 1},
          currentScores: {},
        ),
      );

  void updateLevel(HandType handType, int delta) {
    final currentLevel = state.activeLevels[handType] ?? 1;

    final newLevel = (currentLevel + delta).clamp(1, 3);

    final updatedLevels = Map<HandType, int>.from(state.activeLevels)
      ..[handType] = newLevel;

    emit(state.copyWith(activeLevels: updatedLevels));
  }
}
