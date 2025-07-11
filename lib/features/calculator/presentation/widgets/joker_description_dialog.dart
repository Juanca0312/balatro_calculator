import 'package:balatro_calculator/core/entities/jokers/joker.dart';
import 'package:balatro_calculator/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class JokerDescriptionDialog extends StatelessWidget {
  const JokerDescriptionDialog({super.key, required this.joker});

  final Joker joker;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      title: Text(
        joker.name,
        style: textTheme.headlineSmall?.copyWith(color: colorScheme.green),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Stack(
              children: [
                Image.asset(
                  joker.assetPath,
                  height: 150,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${joker.cost}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(joker.description, textAlign: TextAlign.center),
          ),
        ],
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
