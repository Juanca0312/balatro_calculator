import 'package:balatro_calculator/core/theme/app_colors.dart';
import 'package:balatro_calculator/core/utils/constants.dart';
import 'package:balatro_calculator/features/calculator/presentation/widgets/hand_tile.dart';
import 'package:flutter/material.dart';

class HandsSection extends StatelessWidget {
  const HandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            'Nivel jugadas',
            style: textTheme.headlineMedium?.copyWith(color: colorScheme.green),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orderedHands.length,
            itemBuilder: (context, index) {
              final hand = orderedHands[index];
              return HandTile(handType: hand);
            },
          ),
        ],
      ),
    );
  }
}
