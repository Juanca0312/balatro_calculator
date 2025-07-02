import 'package:balatro_calculator/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class GreenContainer extends StatelessWidget {
  const GreenContainer({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Center(
          child: Text(
            text,
            style: textTheme.displayMedium?.copyWith(
              color: colorScheme.lightGreen,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
