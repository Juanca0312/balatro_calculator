import 'package:balatro_calculator/core/entities/jokers/joker.dart';
import 'package:flutter/material.dart';

class JokerCardTile extends StatelessWidget {
  const JokerCardTile({
    super.key,
    required this.joker,
    required this.isSelected,
    required this.onTap,
    required this.onInfoTap,
  });

  final Joker joker;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onInfoTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border:
                isSelected
                    ? Border.all(color: Colors.blueAccent, width: 2)
                    : Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
            boxShadow:
                isSelected
                    ? [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ]
                    : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(joker.assetPath, fit: BoxFit.contain),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(8),
                  ),
                ),
                child: Text(
                  joker.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        // Cost badge (top-left)
        Positioned(
          top: 4,
          left: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
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
        // Info icon (top-right)
        Positioned(
          top: 5,
          right: 5,
          child: GestureDetector(
            onTap: onInfoTap,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.info_outline,
                size: 20,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
