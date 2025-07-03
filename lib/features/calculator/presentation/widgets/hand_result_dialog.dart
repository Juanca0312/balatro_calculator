import 'package:balatro_calculator/core/theme/app_colors.dart';
import 'package:balatro_calculator/features/calculator/domain/entities/hand_score_result.dart';
import 'package:flutter/material.dart';

class HandResultDialog extends StatelessWidget {
  const HandResultDialog({super.key, required this.scoreResult});

  final HandScoreResult scoreResult;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      title: Text(
        'Score result',
        style: textTheme.headlineSmall?.copyWith(color: colorScheme.green),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Text(scoreResult.toString(), textAlign: TextAlign.center)],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
