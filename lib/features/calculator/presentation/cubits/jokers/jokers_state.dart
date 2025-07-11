part of 'jokers_cubit.dart';

class JokersState extends Equatable {
  const JokersState({
    required this.allJokers,
    required this.selectedJokers,
    required this.filteredJokers,
  });

  factory JokersState.initial() => JokersState(
    allJokers: jokers,
    selectedJokers: [],
    filteredJokers: jokers,
  );

  final List<Joker> allJokers;
  final List<Joker> selectedJokers;
  final List<Joker> filteredJokers;

  List<Joker> get visibleJokers {
    final selectedSet = selectedJokers.toSet();
    final selected = filteredJokers.where(selectedSet.contains);
    final unselected = filteredJokers.where((j) => !selectedSet.contains(j));
    return [...selected, ...unselected];
  }

  JokersState copyWith({
    List<Joker>? allJokers,
    List<Joker>? selectedJokers,
    List<Joker>? filteredJokers,
  }) => JokersState(
    allJokers: allJokers ?? this.allJokers,
    selectedJokers: selectedJokers ?? this.selectedJokers,
    filteredJokers: filteredJokers ?? this.filteredJokers,
  );

  @override
  List<Object> get props => [allJokers, selectedJokers, filteredJokers];
}
