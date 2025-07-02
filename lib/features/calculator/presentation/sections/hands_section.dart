import 'package:balatro_calculator/core/enums/hand_type.dart';
import 'package:balatro_calculator/core/theme/app_colors.dart';
import 'package:balatro_calculator/core/utils/constants.dart';
import 'package:balatro_calculator/features/calculator/presentation/widgets/hand_example_dialog.dart';
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
            style: textTheme.headlineSmall?.copyWith(color: colorScheme.green),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: orderedHands.length,
              itemBuilder: (context, index) {
                final hand = orderedHands[index];
                return HandTile(
                  handType: hand,
                  onTap: () async => _showHandExample(context, hand: hand),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showHandExample(
    BuildContext context, {
    required HandType hand,
  }) async {
    showDialog(context: context, builder: (_) => HandExampleDialog(hand: hand));
  }
}
