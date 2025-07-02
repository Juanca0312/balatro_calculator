part of 'hand_cubit.dart';

class HandState extends Equatable {
  const HandState({required this.activeLevels, required this.currentScores});

  final Map<HandType, int> activeLevels; // Nivel activo por cada mano
  final Map<HandType, int> currentScores; // Puntaje calculado para cada mano

  HandState copyWith({
    Map<HandType, int>? activeLevels,
    Map<HandType, int>? currentScores,
  }) => HandState(
    activeLevels: activeLevels ?? this.activeLevels,
    currentScores: currentScores ?? this.currentScores,
  );

  @override
  List<Object> get props => [activeLevels, currentScores];
}
