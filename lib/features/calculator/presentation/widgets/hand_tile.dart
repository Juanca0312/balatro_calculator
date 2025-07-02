import 'package:balatro_calculator/core/enums/hand_type.dart';
import 'package:balatro_calculator/core/utils/constants.dart';
import 'package:balatro_calculator/features/calculator/presentation/cubits/hand/hand_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HandTile extends StatelessWidget {
  const HandTile({super.key, required this.handType, this.onTap});

  final HandType handType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final level = context.select(
      (HandCubit cubit) => cubit.state.activeLevels[handType] ?? 1,
    );

    final score = context.select((HandCubit cubit) {
      final handScore = handScores.firstWhere((h) => h.handType == handType);
      return handScore.getScoreForLevel(level);
    });

    // final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('Lv. $level', style: textTheme.bodyMedium),
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(handType.title, style: textTheme.bodyMedium)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                score.toString(),
                style: textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
