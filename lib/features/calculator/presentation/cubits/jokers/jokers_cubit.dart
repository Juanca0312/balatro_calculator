import 'package:balatro_calculator/core/entities/jokers/joker.dart';
import 'package:balatro_calculator/core/entities/jokers/score_jocker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'jokers_state.dart';

class JokersCubit extends Cubit<JokersState> {
  JokersCubit() : super(JokersState.initial());

  void filterByQuery(String query) {
    final lowerQuery = query.toLowerCase();
    final filtered =
        state.allJokers
            .where((joker) => joker.name.toLowerCase().contains(lowerQuery))
            .toList();

    emit(state.copyWith(filteredJokers: filtered));
  }

  void selectJoker(Joker joker) {
    if (state.selectedJokers.contains(joker)) return;

    final updated = List<Joker>.from(state.selectedJokers)..add(joker);
    emit(state.copyWith(selectedJokers: updated));
  }

  void removeJoker(Joker joker) {
    final updated = List<Joker>.from(state.selectedJokers)..remove(joker);
    emit(state.copyWith(selectedJokers: updated));
  }
}
