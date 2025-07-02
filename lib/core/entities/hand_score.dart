import 'package:balatro_calculator/core/enums/hand_type.dart';

class HandScore {
  const HandScore({required this.handType, required this.scores});
  final HandType handType;
  final List<int> scores; // [nivel1, nivel2, nivel3, nivel4]

  int getScoreForLevel(int level) {
    if (level < 1 || level > scores.length) {
      throw RangeError('Nivel inválido: $level');
    }
    return scores[level - 1];
  }
}
