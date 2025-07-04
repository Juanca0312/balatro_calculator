import 'package:flutter/material.dart';

class LevelControl extends StatelessWidget {
  const LevelControl({
    super.key,
    required this.level,
    required this.onIncrement,
    required this.onDecrement,
    this.textStyle,
  });
  final int level;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _LevelButton(icon: Icons.remove, onPressed: onDecrement),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text('Lv. $level', style: textStyle),
        ),
        _LevelButton(icon: Icons.add, onPressed: onIncrement),
      ],
    ),
  );
}

class _LevelButton extends StatelessWidget {
  const _LevelButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 24,
    height: 24,
    child: IconButton(
      padding: EdgeInsets.zero,
      iconSize: 16,
      icon: Icon(icon),
      onPressed: onPressed,
    ),
  );
}
